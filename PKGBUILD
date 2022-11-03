# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=annotate
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=1.76.0
pkgrel=1
pkgdesc='Annotation for microarrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-dbi
  r-httr
  r-xml
  r-xtable
)
optdepends=(
  r-biostrings
  r-genefilter
  r-go.db
  r-hgu95av2.db
  r-humanchrloc
  r-iranges
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rae230a.db
  r-rae230aprobe
  r-rgraphviz
  r-runit
  r-tkwidgets
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6ad0db66b81c9f998852b18df0cea0847eff3409b71abd03bdc60e6fc6b6551a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
