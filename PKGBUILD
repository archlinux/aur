pkgname=how-to-use-pvs-studio-free
pkgver=7.31
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
sha256sums=('efff729d84402581840410912cc4e9da6cc2f496c596359f1b1bc0dc31951347')

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
