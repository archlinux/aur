pkgname=how-to-use-pvs-studio-free
pkgver=7.32
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
sha256sums=('bbf374c8b594beda2eed1ae57bf4fd503c1e39f4bade1ae0b41f92ef92852976')

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
