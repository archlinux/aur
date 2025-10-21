# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=cNORM
_pkgver=3.5.1
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
  r-markdown
  r-readxl
  r-rmarkdown
  r-shiny
  r-shinycssloaders
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d352be6d75f33d94a0fd9f08c28eca7a')
b2sums=('2897754745ffe773bb5d1d1d72ba7d6e62d1a328b2cf24b4aa55f27e95402f952cb411f08a6de573782184949ff0dab798b6edb494f883cd67c862cf0dde590e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
