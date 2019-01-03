# Maintainer: Philippe Hürlimann <p@hurlimann.org>
pkgname=retdec
pkgver=3.2
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
sha384sums=('beb3e33c04f2f264d86d3f9f06a75f856a27fc5fa2d9643c3d745a9f01be1a3116d69be18cd98143b197d7a843e72521')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cd build
  make install
}
