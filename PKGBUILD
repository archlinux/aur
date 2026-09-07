# Maintainer: Wellinton Vieira <wellintonvieira.office@gmail.com>
pkgname=arch-run-cat
pkgver=0.4.2
pkgrel=1
pkgdesc="Animated run-cat native XFCE panel plugin (5 frames x 2 themes, CPU-proportional)"
arch=('x86_64')
url="https://github.com/nellowint/arch-run-cat"
license=('MIT')
depends=('xfce4-panel>=4.18' 'gtk3' 'xfconf' 'libxfce4util' 'gdk-pixbuf2')
makedepends=('meson' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nellowint/arch-run-cat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8eca9cf5d51c30157319cfb2be41af375f4b7f80f28d2c7f800b64d3379da79a')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
