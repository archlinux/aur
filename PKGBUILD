# Maintainer: Lassebq <lassebq dot mine at gmail dot com>
pkgname=wlr-autorotate-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Automatically changes screen orientation in wlroots based compositors based on the state of accelerometer"
arch=(x86_64)
url="https://github.com/Lassebq/wlr-autorotate"
license=('MIT')
depends=('iio-sensor-proxy' 'glib2' 'wayland')
makedepends=('cmake'
             'gcc'
             'git'
             'make'
             )
source=("$pkgname::git+https://github.com/Lassebq/wlr-autorotate.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make all
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/wlr-autorotate "$pkgdir/usr/bin/wlr-autorotate"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
