# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BSgenome.Celegans.UCSC.ce2
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=4
pkgdesc='Full genome sequences for Caenorhabditis elegans (UCSC version ce2)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bsgenome
)
optdepends=(
  r-genomicfeatures
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a8ab86ce9314223440a3e59a64fff37a42e408b08af0a829be59d6f375dcf6f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
