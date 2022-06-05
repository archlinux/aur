# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BSgenome.Hsapiens.UCSC.hg38
_pkgver=1.4.4
pkgname=r-${_pkgname,,}
pkgver=1.4.4
pkgrel=4
pkgdesc='Full genome sequences for Homo sapiens (UCSC version hg38, based on GRCh38.p13)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bsgenome
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('024e3571b70f8e07bd50c4dd4d2dc05288497bf5409a9ac4ef12db94b081b50f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
