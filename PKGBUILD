# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Cory Jorgensen <coryj@gmx.com>

pkgname=libtorch-cuda
_name="${pkgname%%-cuda}"
pkgver=2.8.0
_ver=cu129
pkgrel=1
pkgdesc='PyTorch C++ API'
arch=('x86_64')
url='https://pytorch.org/'
license=('BSD')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}_${_ver}-${pkgver}.zip"::"https://download.pytorch.org/libtorch/${_ver}/libtorch-shared-with-deps-${pkgver}%2B${_ver}.zip")
b2sums=('de70380abb6092e28374f82b1fd6ca4fc5de0b011ac41ef395e532b387143fc4a8ff3403e0e445aa1bfc56928fd32a9749a1e25bc0e32708d2a14c5b46241f91')
options=(!strip libtool staticlibs !debug)

package() {
  install -vdm755 "${pkgdir}/opt"
  cp -r "${srcdir}/${_name}" "${pkgdir}/opt"
} 
