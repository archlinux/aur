# Maintainer: SanskritFritz (gmail)
# Contributor: tsdgeos (AUR)

pkgname=charmtimetracker
pkgver=1.12.0
pkgrel=3
arch=(any)
pkgdesc="Keep track of time. It is built around two major ideas - tasks and events."
license=("GPL")
depends=('qt5-base' 'qt5-script' 'qtkeychain')
makedepends=('cmake' 'make')
url="https://github.com/KDAB/Charm"
source=("https://github.com/KDAB/Charm/archive/${pkgver}.tar.gz")
sha256sums=('82e1b2356bd5a29f4b6b19b6c7dc7a8b0ce32574a5999b617647743e012f52b6')

prepare() {
  mkdir -p build
}

build() {
    cd build
    cmake \
      -DCharm_VERSION=${pkgver} \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_TESTING=OFF \
      ../Charm-${pkgver}
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
