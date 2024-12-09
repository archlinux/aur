# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=NGLVieweR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Interactive 3D Visualization of Molecular Structures'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-htmlwidgets
  r-magrittr
  r-shiny
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-webshot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1ea34e4d6a5ae9ef5ef5eb0471c0a624c9425194408214bee237750db16e4c0c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
