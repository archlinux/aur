# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=wl-vapi-gen
pkgver=1.0.0
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
sha256sums=('28a130fa59c883f23c3aaaacd326a7c42bdc449dc809103814db9c077934000f')

build() {
  cd $pkgname-$pkgver
  arch-meson build
  meson compile -C build
}

package() {
  cd $pkgname-$pkgver
  meson install -C build --destdir "$pkgdir"
}

