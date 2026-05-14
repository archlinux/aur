# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Cory Jorgensen <coryj@gmx.com>

pkgname=libtorch-cuda
_name="${pkgname%%-cuda}"
pkgver=2.12.0
_ver=cu130
pkgrel=1
pkgdesc='PyTorch C++ API'
arch=('x86_64')
url='https://pytorch.org/'
license=('BSD')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}_${_ver}-${pkgver}.zip"::"https://download.pytorch.org/libtorch/${_ver}/libtorch-shared-with-deps-${pkgver}%2B${_ver}.zip")
b2sums=('6322761adecce9a35733d3e9d4fe3d877a5026eda2ced98015efc009c6aaa08d43dbcdbb8ad0d955b43c1ca830f446e0e91e6e1451833e3c3c9af5a82f61243c')
options=(!strip libtool staticlibs !debug)

package() {
  install -vdm755 "${pkgdir}/opt"
  cp -r "${srcdir}/${_name}" "${pkgdir}/opt"
} 
