# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Evert Vorster <evorster@gmail.com>

pkgname=vegastrike
pkgver=0.9.1
pkgrel=1
pkgdesc="Vega Strike - Upon the Coldest Sea. Space flight and trading simulator with realistic distances"
arch=(any)
url="https://www.vega-strike.org/"
license=(GPL2)
depends=(vegastrike-engine)
makedepends=(git cmake)
options=(!strip)
source=("Vega-Strike-Assets-Production::git+https://github.com/vegastrike/Assets-Production#tag=v${pkgver}")
sha256sums=('4780003b8480d2a9af91ea5e1677761a6946d3d913a423d28d21e7a39b54d9fe')

build(){
  cmake -B build -S "Vega-Strike-Assets-Production" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
