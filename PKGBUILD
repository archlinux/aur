# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Cory Jorgensen <coryj@gmx.com>

pkgname=libtorch-cuda
_name="${pkgname%%-cuda}"
pkgver=2.2.2
_ver=cu121
pkgrel=2
pkgdesc='PyTorch C++ API'
arch=('x86_64')
url='pytorch.org'
license=('BSD')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}_${_ver}-${pkgver}.zip"::"https://download.pytorch.org/libtorch/${_ver}/libtorch-shared-with-deps-${pkgver}%2B${_ver}.zip")
sha512sums=('c8fc08ec5a195292570e72f65f5ed9c240206cf8c5ed4baf3963bd5654feace476ff7787532e685a2e18a256cfb8332e7b6a20d467bbfbfc8a7c8d1137df3589')
options=(!strip libtool staticlibs !debug)

package() {
  install -vdm755 "${pkgdir}/opt"
  cp -r "${srcdir}/${_name}" "${pkgdir}/opt"
} 
