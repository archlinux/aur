# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=odroid-auto-bridge
pkgver=0.8
pkgrel=1
pkgdesc="A method to create a network bridge for ODROID hardware"
arch=('any')
url="https://github.com/graysky2/odroid-c2-bridge"
license=('MIT')
conflicts=('odroid-c2-bridge')
replaces=('odroid-c2-bridge')
depends=('bridge-utils' 'iproute2' 'systemd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1bd246d21cbde6c2b3770384b4881fedf8a7d70e17cac1d7a09def268b143e39')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
