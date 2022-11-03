# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EGAD
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Extending guilt by association by degree'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-geoquery
  r-gplots
  r-igraph
  r-impute
  r-limma
  r-plyr
  r-rcolorbrewer
  r-rcurl
  r-zoo
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e0a054c56e1d25556618ad6777f6234bd43696e83951419824bc1ba5c869d07')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
