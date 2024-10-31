# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=les
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
pkgrel=1
pkgdesc='Identifying Differential Effects in Tiling Microarray Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-fdrtool
  r-gplots
  r-rcolorbrewer
)
optdepends=(
  r-biobase
  r-limma
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('10a4fadc0d98f76a05bd5654a37ab751866f956302b3a97d3b4c9ffb27a0bb1b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
