# Maintainer: Victor <v1c70rp at gmail dot com>

_pkgname=thrust
pkgname=thrust-git
pkgver=1.9.4.28.g986d178b
pkgrel=1
pkgdesc='A C++ parallel programming library which resembles the C++ Standard Library'
arch=('any')
url="https://github.com/thrust/${_pkgname}"
license=('Apache')

provides=('thrust')
conflicts=('thrust')
makedepends=('git')
depends=()
optdepends=(
  'cuda: for CUDA backend'
  'openmp: for OMP backend'
  'intel-tbb: for TBB backend'
)

source=("git+https://github.com/thrust/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed -e 's|-|.|g'
}

package() {
  install -dm 755 "${pkgdir}/opt/${_pkgname}"
  cd "${srcdir}/${_pkgname}" 
  cp -r ${_pkgname} "${pkgdir}/opt/${_pkgname}/"
  cp -r examples "${pkgdir}/opt/${_pkgname}/"
}

# vim: ft=sh ts=2 sw=2 et
