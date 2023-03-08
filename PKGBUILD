# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ENmix
_pkgver=1.34.01
pkgname=r-${_pkgname,,}
pkgver=1.34.01
pkgrel=3
pkgdesc='Quality control and analysis tools for Illumina DNA methylation BeadChip'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationhub
  r-biobase
  r-doparallel
  r-dynamictreecut
  r-experimenthub
  r-foreach
  r-genefilter
  r-geneplotter
  r-gplots
  r-gtools
  r-illuminaio
  r-impute
  r-iranges
  r-matrixstats
  r-minfi
  r-preprocesscore
  r-quadprog
  r-rpmm
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-minfidata
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bbf736f47f22ce18afc7e7d3c9ff4385e3d61ab3430072bfa7b94d414d42c2d9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
