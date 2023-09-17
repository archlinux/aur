# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=bcm2835
pkgver=1.73
pkgrel=1
pkgdesc="C library for the Raspberry Pi"
arch=('armv6h' 'armv7h' 'armv8h' 'i686' 'x86_64')
url="https://www.airspayce.com/mikem/bcm2835/"
license=('GPL3')
source=("https://www.airspayce.com/mikem/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('a5ec8bb12adb105a7aabeb773007624d4c50518994e266cf27e3548728c6eab366cf25f518b9f95f8e63d52e4bcf7c7921b2cfc7236c20760997f7ec8f48b7e9')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

# Disabled because the check needs root permissions
#check() {
#  cd "$pkgname-$pkgver"
#  make check
#}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
