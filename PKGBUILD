# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rsubread
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
pkgrel=1
pkgdesc='Mapping, quantification and variant analysis of sequencing data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('36213040ce13f0beccb66922c472aab338722ead9565a466cd75d063693f0a46')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
