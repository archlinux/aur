# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=libosso
pkgver=2.35
pkgrel=1
pkgdesc="Basic library for Maemo applications"
arch=("x86_64" "i686")
url="https://github.com/maemo-leste/libosso"
license=('LGPL2.1')
depends=('dbus-glib')
makedepends=('mce-dev')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maemo-leste/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('8f542e2cac593f2d4bbb7faba0b3d31ea88be07fefaa17ad77961dcb4e0fe2a9958fdf79e29e76bdbfd1b62c434c4a4018a26ec2da5a8e917a1de884d3b6892b')

prepare() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
