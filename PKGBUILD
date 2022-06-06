# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SoupX
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=1.6.1
pkgrel=3
pkgdesc='Single Cell mRNA Soup eXterminator'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-seurat
)
optdepends=(
  r-dropletutils
  r-formatr
  r-knitr
  r-rmarkdown
  r-rstan
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2539371ed9e47f5e3c8d86ed6aef155adbe2372a873e225f3b51f1f867f47320')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
