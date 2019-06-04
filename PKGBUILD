# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mpage
pkgver=2.5.7
pkgrel=3
pkgdesc="Print several pages on a single sheet of paper."
url="http://www.mesa.nl/download.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
source=("http://www.mesa.nl/pub/mpage/$pkgname-$pkgver.tgz")
sha256sums=('51ab9c4e5fdd37e03c90df6756f30c0b61a34f066cb625f8924feedc4b3ec3fe')

build() {
  cd $pkgname-$pkgver
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
}


