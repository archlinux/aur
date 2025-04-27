# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=goseq
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=1.60.0
pkgrel=1
pkgdesc='Gene Ontology analyser for RNA-seq and other length biased data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-annotationdbi
  r-biasedurn
  r-biocgenerics
  r-genelendatabase
  r-go.db
)
optdepends=(
  r-edger
  r-org.hs.eg.db
  r-rtracklayer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c02e8d9e46f515ecb94e38bd8908922e9234494acd7264194ef9ec89d517ba21')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
