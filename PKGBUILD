# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=dune3d
pkgver=0.9.3
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
  '8716013cf89d240acceb75a1c33fac4027734d37f01362766895c1eea9096bb0'
)

build() {
  cd dune3d-$pkgver
  arch-meson build

  cd build
  ninja
}

package() {
    cd dune3d-$pkgver/build
    DESTDIR="$pkgdir" ninja install
}
