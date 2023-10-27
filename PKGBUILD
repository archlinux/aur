# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CexoR
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='An R package to uncover high-resolution protein-DNA interactions in ChIP-exo replicates'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomation
  r-genomeinfodb
  r-genomicranges
  r-idr
  r-iranges
  r-rcolorbrewer
  r-rsamtools
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c464cda22f9c2d96a0069ce77498162ccf83bc75dda7360b45c0ccfaea26cb65')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
