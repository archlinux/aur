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
source=("${pkgname}-${pkgver}.zip::https://download.pytorch.org/libtorch/cu121/libtorch-cxx11-abi-shared-with-deps-2.1.0%2Bcu121.zip")
sha512sums=('51d6558149a63eb05c2cc4363f1eb0222e81b14003d091e604235eceb4927f85e346ed61ab9d738ddad26b470d95c73efcdcc4335240f28cd418c7ac0789f9e4')

package() {
  rm "${pkgname}-${pkgver}.zip"
  install -d "${pkgdir}/usr/lib/"
  rm ${srcdir}/libtorch/lib/libcudnn*
  mv ${srcdir}/libtorch/lib/* ${pkgdir}/usr/lib/
  install -d ${pkgdir}/usr/include/
  rm ${srcdir}/libtorch/include/dnnl*
  mv ${srcdir}/libtorch/include/* ${pkgdir}/usr/include/
  install -d ${pkgdir}/usr/share/cmake/
  mv ${srcdir}/libtorch/share/cmake/* ${pkgdir}/usr/share/cmake/
  rm -r ${srcdir}
} 
