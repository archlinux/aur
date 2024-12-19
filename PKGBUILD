# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=correlation
_pkgver=0.8.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Methods for Correlation Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-bayestestr
  r-datawizard
  r-insight
  r-parameters
)
optdepends=(
  r-bayesfactor
  r-energy
  r-ggplot2
  r-ggraph
  r-gt
  r-hmisc
  r-knitr
  r-lme4
  r-mbend
  r-openxlsx2
  r-polycor
  r-poorman
  r-ppcor
  r-psych
  r-rmarkdown
  r-rmcorr
  r-rstanarm
  r-see
  r-testthat
  r-tidygraph
  r-wdm
  r-wrs2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fdd4bce864c73bd9d5f8a7725a8a906b')
b2sums=('f171ea2abe4842efeef30a0fb6af544053b1853f5d0d3553079f98bdc3470bafd63090a122d1f204e03c794b0276b32529737b83b4c65268b3875b758e1fdb84')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
