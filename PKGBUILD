# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=wl-vapi-gen
pkgver=1.1.0
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/kotontrion/wl-vapi-gen/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6ad746dd13c454e2901da7aec14f744a76d3d022809197b04c5a6774b503a079')

build() {
  cd $pkgname-$pkgver
  arch-meson build
  meson compile -C build
}

package() {
  cd $pkgname-$pkgver
  meson install -C build --destdir "$pkgdir"
}

