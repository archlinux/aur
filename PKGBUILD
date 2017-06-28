# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mpage
pkgver=2.5.7
pkgrel=1
pkgdesc="Print several pages on a single sheet of paper."
url="http://www.mesa.nl/download.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
source=("http://www.mesa.nl/pub/mpage/$pkgname-$pkgver.tgz")
md5sums=('9287f30c9b077f7e47e4b632ef5448e8')

build() {
  cd $pkgname-$pkgver
  make DESTDIR=/usr
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
}


