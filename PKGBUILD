# Maintainer: Luca Weiss <WEI16416@spengergasse.at>
pkgname=bcm2835
pkgver=1.49
pkgrel=1
pkgdesc="C library for the Raspberry Pi"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://www.airspayce.com/mikem/bcm2835/"
license=('GPL2')
provides=('bcm2835')
source=("http://www.airspayce.com/mikem/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('15dcad0ef93a95fab7dca1bf477075cd')
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
