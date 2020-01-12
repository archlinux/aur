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
sha512sums=('28725d6a54da74dd911237920beb0f166cf4676ced7a7c8763521c1c0da6f698b48c35dde25eba979597693016af9795d6f4eeba65b5e0afd21c3312847a7b65')


build() {
  cd "$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/"
  make DESTDIR="${pkgdir}" install
}
