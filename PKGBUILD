# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=odroid-auto-bridge
pkgver=0.7
pkgrel=1
pkgdesc="A method to create a network bridge for ODROID hardware"
arch=('any')
url="https://github.com/graysky2/odroid-c2-bridge"
license=('MIT')
conflicts=('odroid-c2-bridge')
replaces=('odroid-c2-bridge')
depends=('bridge-utils' 'iproute2' 'systemd')
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('bf30841227e46b6dd906ebc675c0e4009298f097caac06586a0848ac9e0ec55f')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
