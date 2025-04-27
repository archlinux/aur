# system requirements: JAGS 4.0.0
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HiLDA
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Conducting statistical inference on comparing the mutational exposures of mutational signatures by using hierarchical latent Dirichlet allocation'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-biocgenerics
  r-biostrings
  r-bsgenome.hsapiens.ucsc.hg19
  r-cowplot
  r-forcats
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-r2jags
  r-rcpp
  r-s4vectors
  r-stringr
  r-tidyr
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-xvector
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('be24289c20777ba3bce3883dc59834d92346acff282c8c6fffc3d274c51fceff')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
