# system requirements: OpenBabel (>= 3.0.0) with headers(http://openbabel.org). Eigen3 with headers.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChemmineOB
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='R interface to a subset of OpenBabel functionalities'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-bh
  r-biocgenerics
  r-rcpp
  r-zlibbioc
  openbabel
  eigen
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-chemminer
  r-chemminer
  r-knitr
  r-knitrbootstrap
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9115e25d3be94148fcc549b22af107c3fe0055569ac4e36ce161a203a8698450')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
