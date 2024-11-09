# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MotifDb
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='An Annotated Collection of Protein-DNA Binding Sequence Motifs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-genomicranges
  r-iranges
  r-rtracklayer
  r-s4vectors
  r-splitstackshape
)
optdepends=(
  r-biocstyle
  r-formatr
  r-knitr
  r-markdown
  r-rmarkdown
  r-runit
  r-seqlogo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('680942ef538b41afbbf6620a6fb306b878d10c7fdd957cbd4e671dc88e48f82d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
