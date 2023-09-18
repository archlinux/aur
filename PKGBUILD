# Maintainer: Lassebq <lassebq dot mine at gmail dot com>
pkgname=fbcon-autorotate
pkgver=0.1.0
pkgrel=1
pkgdesc="Automatically changes screen orientation in framebuffer console based on the state of accelerometer"
arch=(any)
url="https://github.com/Lassebq/fbcon-autorotate"
license=('MIT')
depends=('iio-sensor-proxy' 'sed')
source=("$pkgname.tar.gz::https://github.com/Lassebq/fbcon-autorotate/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 fbcon-autorotate "$pkgdir/usr/lib/systemd/scripts/fbcon-autorotate"
  install -Dm644 fbcon-autorotate.service "$pkgdir/usr/lib/systemd/system/fbcon-autorotate.service"
}
