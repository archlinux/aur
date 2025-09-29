# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=correlation
_pkgver=0.8.8
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
md5sums=('5e0b8cbdffa45d1a9da82f72ba2a7e82')
b2sums=('a6e92148872d65556b94d32be53649910c873ecd1c0de3b1aec73a88123f019fff08f18988e63dbe35ecf2ad18050913f9eb9a5a58004f467165d90cc9b5589e')

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
