pkgname=retdec
pkgver=3.3
pkgrel=1
arch=('x86_64')
pkgdesc="A retargetable machine-code decompiler based on LLVM."
url="https://retdec.com/"
license=('MIT')
depends=('graphviz' 'bc' 'upx' 'wget' 'python')
makedepends=('perl' 'cmake')
provides=('retdec')
conflicts=('retdec')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/avast-tl/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f8f3c25794b022727c51f9c4c6ad75f7d2fa60c540ca55b71aa68bbe5a2d102f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make install
}
