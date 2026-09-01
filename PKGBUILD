# Maintainer: Wellinton Vieira <wellintonvieira.office@gmail.com>
pkgname=arch-run-cat
pkgver=0.4.0
pkgrel=1
pkgdesc="Animated run-cat native XFCE panel plugin (5 frames x 2 themes, CPU-proportional)"
arch=('x86_64')
url="https://github.com/nellowint/arch-run-cat"
license=('MIT')
depends=('xfce4-panel>=4.18' 'gtk3' 'xfconf' 'libxfce4util' 'gdk-pixbuf2')
makedepends=('meson' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nellowint/arch-run-cat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('87d84b7002f9f356bf3b8a8023678de82a18a5d6f67ea572a130686865497a2d')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
