# Maintainer: Cory Jorgensen <coryj@gmx.com>

pkgname="libtorch-cuda"
pkgver=2.1.0
pkgrel=1
pkgdesc="Pytorchs C++ direct implementation"
arch=('x86_64')
url="www.pytorch.org"
license=('BSD')
depends=('cuda' 'cuda-tools' 'onednn' 'cudnn' 'cmake')
provides=()
conflicts=()
source=("libtorch-cuda.zip::https://download.pytorch.org/libtorch/cu121/libtorch-cxx11-abi-shared-with-deps-2.1.0%2Bcu121.zip")
sha512sums=('51d6558149a63eb05c2cc4363f1eb0222e81b14003d091e604235eceb4927f85e346ed61ab9d738ddad26b470d95c73efcdcc4335240f28cd418c7ac0789f9e4')

package() {
  install -d "${pkgdir}/usr/lib/"
  rm ${srcdir}/libtorch/lib/libcudnn*
  cp -r ${srcdir}/libtorch/lib/* ${pkgdir}/usr/lib/
  install -d ${pkgdir}/usr/include/
  rm ${srcdir}/libtorch/include/dnnl*
  cp -r ${srcdir}/libtorch/include/* ${pkgdir}/usr/include/
  install -d ${pkgdir}/usr/share/cmake/
  cp -r ${srcdir}/libtorch/share/cmake/* ${pkgdir}/usr/share/cmake/
} 
