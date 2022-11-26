# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggstar
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=1.0.4
pkgrel=3
pkgdesc="Multiple Geometric Shape Point Layer for 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-cli
  r-ggplot2
  r-gridextra
  r-scales
)
optdepends=(
  r-knitr
  r-markdown
  r-prettydoc
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eda19b1be4f5719fdb251666b90f4d664b90b882c452d4b015a60727c3b55354')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
