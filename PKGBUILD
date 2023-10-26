# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Category
_pkgver=2.68.0
pkgname=r-${_pkgname,,}
pkgver=2.68.0
pkgrel=1
pkgdesc='Category Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-dbi
  r-genefilter
  r-graph
  r-gseabase
  r-rbgl
)
optdepends=(
  r-all
  r-ebarrays
  r-geneplotter
  r-go.db
  r-gostats
  r-hgu95av2.db
  r-karyoploter
  r-keggrest
  r-lattice
  r-limma
  r-org.sc.sgd.db
  r-rcolorbrewer
  r-rgraphviz
  r-runit
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c0414bde443705cbf11b221c7df38a6252bc9ad5000a56a99759bfe027ee1ea7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
