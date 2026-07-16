# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MotifDb
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=1.54.0
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
sha256sums=('5cc3906dadb8363cbde1a5a2ee20a1f0ea8c6cd1e2f591384e14e4acb5b47b4e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
