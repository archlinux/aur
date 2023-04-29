# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethylAid
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Visual and interactive quality control of large Illumina DNA Methylation array data sets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-ggplot2
  r-gridbase
  r-hexbin
  r-matrixstats
  r-minfi
  r-rcolorbrewer
  r-shiny
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-methylaiddata
  r-minfidata
  r-minfidataepic
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d8147861055c119141681e887962ed5da190384808f36517d53cc783d841dcbb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
