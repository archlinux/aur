# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bumphunter
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='Bump Hunter'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-dorng
  r-foreach
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-iterators
  r-limma
  r-locfit
  r-matrixstats
  r-s4vectors
)
optdepends=(
  r-doparallel
  r-org.hs.eg.db
  r-runit
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a40472da917c50687e6185e0b078ce43f1acbab5303173b9a3de327afaecb3a0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
