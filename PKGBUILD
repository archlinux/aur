# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bumphunter
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
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
sha256sums=('bf50487a1b6a97b779a053422c9725abf041da6fe6b1299534f8a93e54e9ba15')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
