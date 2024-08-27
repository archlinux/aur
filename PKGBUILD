# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=cNORM
_pkgver=3.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Continuous Norming"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-ggplot2
  r-leaps
)
optdepends=(
  r-knitr
  r-readxl
  r-rmarkdown
  r-shiny
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f7edbc5a6f8942a6ff005be8ad36ce78')
b2sums=('8ac1d02f3d63a565854ad0d704e4cdbd7435d76b6807e1d48cf52710606986a7db6444ac7f273e636d84abead19a9f45139ed5b4d04f28f2e6ac7e9e92dd767c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
