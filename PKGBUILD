# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Cory Jorgensen <coryj@gmx.com>

pkgname=libtorch-cuda
_name="${pkgname%%-cuda}"
pkgver=2.7.0
_ver=cu128
pkgrel=1
pkgdesc='PyTorch C++ API'
arch=('x86_64')
url='https://pytorch.org/'
license=('BSD')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}_${_ver}-${pkgver}.zip"::"https://download.pytorch.org/libtorch/${_ver}/libtorch-cxx11-abi-shared-with-deps-${pkgver}%2B${_ver}.zip")
b2sums=('6bb07d3e16b115da04b978b39321b40693d0cbf7f73abd0a256f0570b185c28518e10f6867318d940240f7f55cc2ac6372ea24e407de2a1a8f7f4b7eb41a1a3b')
options=(!strip libtool staticlibs !debug)

package() {
  install -vdm755 "${pkgdir}/opt"
  cp -r "${srcdir}/${_name}" "${pkgdir}/opt"
} 
