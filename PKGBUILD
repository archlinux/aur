# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rnaEditr
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
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
sha256sums=('b8b2ca86bf742693d26f4daf8f3a3bcc3ecc5a25a6f7bd41cf4eb0bb5086a475')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
