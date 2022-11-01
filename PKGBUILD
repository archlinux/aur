# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SoupX
_pkgver=1.6.2
pkgname=r-${_pkgname,,}
pkgver=1.6.2
pkgrel=1
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
sha256sums=('9b6226cd7c0691498a874d5c029f8ff81fd2060295c298985397521c1f7ee3a5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
