# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SNAGEEdata
_pkgver=1.33.0
pkgname=r-${_pkgname,,}
pkgver=1.33.0
pkgrel=1
pkgdesc='SNAGEE data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
)
optdepends=(
  r-all
  r-hgu95av2.db
  r-snagee
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('895d5a742efffdcc5b36cc1b8e023069af585cb795488d9b1c28311fa24e148c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
