# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Cory Jorgensen <coryj@gmx.com>

pkgname=libtorch-cuda
_name="${pkgname%%-cuda}"
pkgver=2.5.1
_ver=cu124
pkgrel=1
pkgdesc='PyTorch C++ API'
arch=('x86_64')
url='https://pytorch.org/'
license=('BSD')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}_${_ver}-${pkgver}.zip"::"https://download.pytorch.org/libtorch/${_ver}/libtorch-shared-with-deps-${pkgver}%2B${_ver}.zip")
b2sums=('605b0030befe019549a8d08a9f5714e7b8f52018c57493474c069a27affdf69239594fa5cb70d6e23fb96be49e84c7a16ff3ab0544d77ff9b91869f987077133')
options=(!strip libtool staticlibs !debug)

package() {
  install -vdm755 "${pkgdir}/opt"
  cp -r "${srcdir}/${_name}" "${pkgdir}/opt"
} 
