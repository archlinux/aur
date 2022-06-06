# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCArray
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Large-scale single-cell RNA-seq data manipulation with GDS files'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-delayedarray
  r-delayedmatrixstats
  r-gdsfmt
  r-iranges
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-markdown
  r-matrix
  r-rmarkdown
  r-runit
  r-scater
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('69196c3e0e835756f09f85527d614dd2ad55205940ca2e5e7af2355e5628a2f9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
