# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=restriktor
_pkgver=0.3-400
pkgname=r-${_pkgname,,}
pkgver=0.3.400
pkgrel=1
pkgdesc='Restricted Statistical Estimation and Inference for Linear Models'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ic.infer
  r-lavaan
  r-mvtnorm
  r-quadprog
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b2121cc2df5ba4218c74d2fb5bca086587fd940c860bd3b552640c12995c5d45')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
