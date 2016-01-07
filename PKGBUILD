# Maintainer: Luca Weiss <WEI16416@spengergasse.at>
pkgname=bcm2835
pkgver=1.49
pkgrel=1
pkgdesc="C library for Raspberry Pi"
arch=('armv6h' 'x86_64')
url="http://www.airspayce.com/mikem/bcm2835/"
license=('GPL')
depends=()
makedepends=()
optdepends=()
provides=('bcm2835')
install=
changelog=
source=("http://www.airspayce.com/mikem/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('1033886435a1d226124b075fc1291f85')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

#check() {
#  cd "$pkgname-$pkgver"
#  export FAKEROOTKEY=fake
#  make check
#}
# Disabled because the check needs root permission

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
