# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=dune3d
pkgver=1.0.0
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
  '64f5c65fbd7b176e9e9feb923b33dbfea36a47e4c239604c27e2bf4049037c16'
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
