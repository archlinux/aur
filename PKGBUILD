# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genbankr
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Parsing GenBank files into semantically useful objects'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biostrings
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rtracklayer
  r-s4vectors
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rentrez
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0809253f50a7d9ce1921300281ff1e1bc5e0802071b4304e52b266acf4e5d31a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
