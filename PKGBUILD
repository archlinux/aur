# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggfittext
_pkgver=0.10.2
pkgname=r-${_pkgname,,}
pkgver=0.10.2
pkgrel=1
pkgdesc="Fit Text Inside a Box in 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-gridtext
  r-shades
  r-stringi
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b796a44c79eb497148eefa1572a378bf1d498742f3fde62bd93e538720278c3e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
