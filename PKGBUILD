# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=cNORM
_pkgver=3.4.1
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
md5sums=('4e5a740f45bb4a18760d0d924dcfd1ba')
b2sums=('7c2d64e0318cdc383888848992397f295b3193c4bad0c5a055d0b40703eea65af823521f3077390b50246f97bb392dcb50d4194d16d87067c80fe1eea0569bde')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
