# Maintainer: Luca Weiss <WEI16416@spengergasse.at>
pkgname=bcm2835
pkgver=1.49
pkgrel=1
pkgdesc="C library for the Raspberry Pi"
arch=('armv6h' 'armv7h')
url="http://www.airspayce.com/mikem/bcm2835/"
license=('GPL2')
provides=('bcm2835')
source=("http://www.airspayce.com/mikem/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('1033886435a1d226124b075fc1291f85')
build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
#check() {
#  cd "$pkgname-$pkgver"
#  make check
#}
# Disabled because the check needs root permission (I don't know how to fix this)
package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
