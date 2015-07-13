# Maintainer: JSkier, jskier at gmail dot com jskier.com
# Created by Paul Richards (paulrichards321(at)gmail(dot)com), http://sourceforge.net/projects/resetmsmice/
pkgname=resetmsmice
pkgver=1.1.2
pkgrel=2
pkgdesc="Application to reset many MS wireless mice models to stop excessive wheel scrolling (only needed if dual booting with Windows)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/resetmsmice/"
license=('GPL')
depends=('libusb')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f3c8e2b1652e6075254e2c624759ac30')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
  make 
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}


