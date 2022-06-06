# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DMRforPairs
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='DMRforPairs: identifying Differentially Methylated Regions between unique samples using array based methylation profiles'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
  r-gviz
  r-r2html
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3a08e0e5bad865bd883a1237b3eee4e2fbc3a00962e5d72a2b618fb7ed0de093')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
