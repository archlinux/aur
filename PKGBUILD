# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Cory Jorgensen <coryj@gmx.com>

pkgname=libtorch-cuda
_name="${pkgname%%-cuda}"
pkgver=2.9.1
_ver=cu130
pkgrel=1
pkgdesc='PyTorch C++ API'
arch=('x86_64')
url='https://pytorch.org/'
license=('BSD')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}_${_ver}-${pkgver}.zip"::"https://download.pytorch.org/libtorch/${_ver}/libtorch-shared-with-deps-${pkgver}%2B${_ver}.zip")
b2sums=('1e7f665a5c51940a0244f751b4108166581e412cf7e5ae01f6af4e34213ccb534db32d98fae6899efded3a9f44ea8c563c6bb0085a934e87fc364c1190df2ef0')
options=(!strip libtool staticlibs !debug)

package() {
  install -vdm755 "${pkgdir}/opt"
  cp -r "${srcdir}/${_name}" "${pkgdir}/opt"
} 
