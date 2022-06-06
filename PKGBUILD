# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metagenomeSeq
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Statistical analysis for sparse high-throughput sequencing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-foreach
  r-glmnet
  r-gplots
  r-limma
  r-matrixstats
  r-rcolorbrewer
  r-wrench
)
optdepends=(
  r-annotate
  r-biocgenerics
  r-biomformat
  r-gss
  r-ihw
  r-interactivedisplay
  r-knitr
  r-testthat
  r-vegan
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('02cc936885c5835fb1a942face09618a4221d11e3c5f0741da00ff471a45106d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
