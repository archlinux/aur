# Contributor: Lex Black <autumn-wind@web.de>

pkgname=libdial
pkgver=2.2
pkgrel=1
pkgdesc="library needed by tzclock"
arch=('i686' 'x86_64')
url="https://theknight.co.uk/"
license=("GPL3")
depends=('gtk3')
source=("https://theknight.co.uk/releases/Source/$pkgname-$pkgver.tar.bz2")
md5sums=('46ab066d2cc09e08736769472cc1ab79')


build() {
  cd "$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/"
  make DESTDIR="${pkgdir}" install
}
