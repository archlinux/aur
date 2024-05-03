# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rnaEditr
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Statistical analysis of RNA editing sites and hyper-editing regions'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-bumphunter
  r-corrplot
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-logistf
  r-plyr
  r-s4vectors
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('55b3b9963ac032d7ee6b6d9948a3c147c1b79de01b23ac49e521fc18688ef0c9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
