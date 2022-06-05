# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chromhmmData
_pkgver=0.99.2
pkgname=r-${_pkgname,,}
pkgver=0.99.2
pkgrel=4
pkgdesc='Chromosome Size, Coordinates and Anchor Files'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f23b04ecd03c29a7fbf1c01f461101f9d1f8f443fa9aeccfc6e9cffae9e9e68d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
