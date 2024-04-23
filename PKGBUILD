# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=bcm2835
pkgver=1.75
pkgrel=1
pkgdesc="C library for the Raspberry Pi"
arch=('armv6h' 'armv7h' 'armv8h' 'i686' 'x86_64')
url="https://www.airspayce.com/mikem/bcm2835/"
license=('GPL3')
source=("https://www.airspayce.com/mikem/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('81cd4f83df4bdbc59c93140623bc423f64b7aff2baee6562cfef0e8aaca70787fc2da7c58b0194a3dcf39a04c53fe09fc3583222b3397455d42bd5d124e858e2')

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
