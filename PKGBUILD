# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BEAT
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='BEAT - BS-Seq Epimutation Analysis Toolkit'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biostrings
  r-bsgenome
  r-genomicranges
  r-shortread
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('afee30daa5aa4f2b34635ad6800b15ee0eaf9128b2e0fdfb479f0c2a8a8ff8c1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
