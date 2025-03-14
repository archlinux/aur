# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=dune3d
pkgver=1.3.0
pkgrel=1
pkgdesc="Parametric 3D CAD"
arch=('x86_64' 'i686')
url="https://dune3d.org"
license=('GPL')
depends=('gtkmm-4.0' 'cairomm' 'opencascade' 'eigen' 'libspnav')
makedepends=('glm' 'python3' 'librsvg' 'meson' 'cmake' 'python-gobject' 'python-cairo')
source=(
  "https://github.com/dune3d/dune3d/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'a9c346005d260e7d9c4da2593d7683536536531fd6cad806bcfe2cf1c1c912e9'
)

build() {
  cd dune3d-$pkgver
  arch-meson build

  meson compile -C build
}

package() {
    cd dune3d-$pkgver
    meson install -C build --destdir "$pkgdir"
}
