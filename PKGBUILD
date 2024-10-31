# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOstats
_pkgver=2.72.0
pkgname=r-${_pkgname,,}
pkgver=2.72.0
pkgrel=1
pkgdesc='Tools for manipulating GO and microarrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-annotationforge
  r-biobase
  r-category
  r-go.db
  r-graph
  r-rbgl
  r-rgraphviz
)
optdepends=(
  r-all
  r-biocgenerics
  r-biocstyle
  r-genefilter
  r-geneplotter
  r-gseabase
  r-hgu95av2.db
  r-knitr
  r-multtest
  r-org.hs.eg.db
  r-rcolorbrewer
  r-runit
  r-sparsem
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f22f944c3db01357362b22edd07f0a0a39866e49eb13d917c80c3d28767de27f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
