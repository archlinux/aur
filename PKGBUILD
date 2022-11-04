# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Sushi
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=4
pkgdesc='Tools for visualizing genomics data'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-zoo
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7804a420ba9d4acfb5fdfbaafe49dba50433f3e4d79b82878779a4f657e6ba29')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
