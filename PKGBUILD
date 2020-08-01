# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=bcm2835
pkgver=1.68
pkgrel=1
pkgdesc="C library for the Raspberry Pi"
arch=('armv6h' 'armv7h' 'armv8h' 'i686' 'x86_64')
url="https://www.airspayce.com/mikem/bcm2835/"
license=('GPL3')
source=("https://www.airspayce.com/mikem/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('bdc91af8f28755899611d41cf954c9b2ca107befe984b79ee6fe23b66bbb7f50e746e084c3e431b1b0cdf1b0735cec8a54018ebf12b713380e5db97e3564f477')

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
