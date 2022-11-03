# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PhIPData
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Container for PhIP-Seq Experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-cli
  r-edger
  r-genomicranges
  r-iranges
  r-s4vectors
  r-summarizedexperiment
  r-biocfilecache
)
optdepends=(
  r-biocstyle
  r-covr
  r-dplyr
  r-knitr
  r-readr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8dabb70df812138a969ce07a4c9181b696742b164b40a50b30ff6f314afea1be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
