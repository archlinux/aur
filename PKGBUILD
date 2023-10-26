# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EGAD
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
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
sha256sums=('a53893dd4859052a7a2124f6a07da5e0961ee2bd35a20511dde1e59a10813b49')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
