# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ITALICS
_pkgver=2.58.0
pkgname=r-${_pkgname,,}
pkgver=2.58.0
pkgrel=1
pkgdesc='ITALICS'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affxparser
  r-dbi
  r-glad
  r-italicsdata
  r-oligo
  r-oligoclasses
  r-pd.mapping50k.xba240
)
optdepends=(
  r-pd.mapping250k.nsp
  r-pd.mapping250k.sty
  r-pd.mapping50k.hind240
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7abd153b4dbd1aa2402680158fef694d2b570d59a8404e04a9b6cffe133c233d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
