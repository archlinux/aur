# Contributor: Nicolas Lorin <androw95220@gmail.com>

_pkgname='Barony'
pkgname='barony'
pkgver=4.1.0
pkgrel=3
arch=('i686' 'x86_64')
url="https://github.com/TurningWheel/Barony"
provides=('barony')
depends=()
makedepends=('cmake' 'libnfd' 'sdl2_image' 'sdl2_net' 'sdl2_ttf' 'physfs' 'rapidjson')
license=('GPL3')
pkgdesc="Barony is the premier first-person roguelike with cooperative play"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/TurningWheel/Barony/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('628c20a36593ca8007ef7590470a6fc23dca2897e186ee98d3d449b565ddf7af')

build() {
  cd "${_pkgname}-${pkgver}"

  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  cmake ..
  make 
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

