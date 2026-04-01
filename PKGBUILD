# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=wl-vapi-gen
pkgver=1.1.0
pkgrel=2
pkgdesc="Generate vala bindings for wayland protocols "
url="https://github.com/kotontrion/wl-vapi-gen"
arch=(any)
license=(MIT)
depends=(
  python
)
makedepends=(
  meson
)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/kotontrion/wl-vapi-gen/archive/$pkgver.tar.gz")
sha256sums=('470ae4fddaef9355346b97c5825e01e3044d20cefca830ac51654577d98caea1')

build() {
  cd $pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd $pkgname
  meson install -C build --destdir "$pkgdir"
}

