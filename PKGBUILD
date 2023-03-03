# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rsubread
_pkgver=2.12.3
pkgname=r-${_pkgname,,}
pkgver=2.12.3
pkgrel=1
pkgdesc='Mapping, quantification and variant analysis of sequencing data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ad498c5c386219989b689e5bd22eb16d7f741d666bbb0009598bc2e791da1552')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
