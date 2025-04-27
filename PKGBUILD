# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=erma
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='epigenomic road map adventures'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-genomeinfodb
  r-genomicfiles
  r-genomicranges
  r-ggplot2
  r-homo.sapiens
  r-iranges
  r-rtracklayer
  r-s4vectors
  r-shiny
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-doparallel
  r-dt
  r-go.db
  r-knitr
  r-png
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f7c1fc9e3a7a8b14381a23b51a02f36e7ca6c1d06baed8ea61f67a1eb99379f9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
