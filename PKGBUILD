# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epiNEM
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='epiNEM'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL-3.0-only')
depends=(
  r
  r-boolnet
  r-e1071
  r-graph
  r-gtools
  r-igraph
  r-latex2exp
  r-latticeextra
  r-minet
  r-mnem
  r-pcalg
  r-rcolorbrewer
  r-boutroslab.plotting.general
)
optdepends=(
  r-annotationhub
  r-biocgenerics
  r-biocstyle
  r-devtools
  r-gosemsim
  r-knitr
  r-org.sc.sgd.db
  r-rmarkdown
  r-runit
  r-stringdb
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f13bae3989a606642902c0d24be807a71394558accb8cead516aacbcd01ac52d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
