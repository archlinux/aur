# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tokenizers
_pkgver=0.2.3
pkgname=r-${_pkgname,,}
pkgver=0.2.3
pkgrel=1
pkgdesc='Fast, Consistent Tokenization of Natural Language Text'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-rcpp
  r-snowballc
  r-stringi
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-stopwords
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('626d6b48b79dc4c3c130aebe201aac620f93665e0c5a890c3b6ca25c465f4207')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
