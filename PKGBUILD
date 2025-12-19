# Maintainer: storbake
pkgname=wallpaper_splitter
pkgver=1.1.3
pkgrel=1
pkgdesc="Split and span a single wallpaper across multiple screens on KDE Plasma"
url="https://github.com/l0drex/wallpaper_splitter"
license=('GPL3')
arch=('x86_64')
depends=(
  'kconfigwidgets'
)
makedepends=(
  'cmake'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/l0drex/wallpaper_splitter/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b1970b27ab4aafc16fd13de53299e7b07ae15f6ff96e40464f868af464e607ec')

build() {
  mkdir -p build
  cd build

  cmake "${srcdir}/${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build .
}

package() {
  cd build
  DESTDIR="${pkgdir}" cmake --install .
}

