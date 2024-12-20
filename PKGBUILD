# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dfoptim
_pkgver=2023.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Derivative-Free optimization algorithms. These algorithms do not require gradient information. More importantly, they can be used to solve non-smooth optimization problems."
arch=('any')
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c436a6d866c94fc71e71a1f6a39bee9245aea1a062dc8dba3b2b229b88d05c30')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
