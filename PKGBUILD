# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSReg
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Gene Set Regulation (GS-Reg)'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-genomicfeatures
  r-homo.sapiens
  r-org.hs.eg.db
)
optdepends=(
  r-genomicranges
  r-gsbenchmark
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ab36a418ff44354da093f92370fe5aee2e08c85033d7fde76059fe94137b3423')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
