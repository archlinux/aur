# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=STAN
_pkgver=2.26.0
pkgname=r-${_pkgname,,}
pkgver=2.26.0
pkgrel=1
pkgdesc='The Genomic STate ANnotation Package'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-genomeinfodb
  r-genomicranges
  r-gviz
  r-iranges
  r-poilog
  r-rsolnp
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-gplots
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d973ed5b2c082b51179bebb6547fa927b6e0c187038172b7c1cc394736bdaf52')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
