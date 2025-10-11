pkgname=how-to-use-pvs-studio-free
pkgver=7.39
pkgrel=1
pkgdesc='An utility that adds special comments to a source code for analyzing the code by PVS-Studio for free'
arch=('x86_64')
url=https://github.com/viva64/$pkgname
license=('Apache-2.0')
depends=(
  gcc-libs
  glibc
)
makedepends=(cmake)
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/${pkgname}_Source_code.tar.gz"
)
sha256sums=('3e30c965e918f594689593c6dbc6ee0b2f17d5f1903c39f1247b171ebce4b494')

build () {
  cd $pkgname

  cmake -B build -S .\
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \

  cmake --build build
}

package() {
  cd $pkgname

  DESTDIR="$pkgdir" cmake --install build
}
