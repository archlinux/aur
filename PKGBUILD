# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MEAT
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Muscle Epigenetic Age Test'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-dynamictreecut
  r-glmnet
  r-impute
  r-minfi
  r-rpmm
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-watermelon
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('04e193fbcfb32689f11ef94a40b3d3220fddaacce53f44d87039dc2e222d4945')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
