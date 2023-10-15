# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Evert Vorster <evorster@gmail.com>

pkgname=vegastrike
pkgver=0.8.0
pkgrel=1
pkgdesc="Vega Strike - Upon the Coldest Sea. Space flight and trading simulator with realistic distances"
arch=(any)
url="https://www.vega-strike.org/"
license=(GPL2)
depends=(vegastrike-engine)
makedepends=(git cmake)
options=(!strip)
source=("Vega-Strike-Assets-Production::git+https://github.com/vegastrike/Assets-Production#tag=v${pkgver}")
sha256sums=('SKIP')

build(){
  cmake -B build -S "Vega-Strike-Assets-Production" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
