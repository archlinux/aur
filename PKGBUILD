# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=wordcloud2
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=0.2.1
pkgrel=4
pkgdesc="Create Word Cloud by 'htmlwidget'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-base64enc
  r-htmlwidgets
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-shiny
  r-webshot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d3f4f49114a503ef206e64771b5160069b5095d7be6f807b8b041763972058a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
