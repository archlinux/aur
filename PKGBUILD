# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=BART
_pkgver=2.9.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Bayesian Additive Regression Trees"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rcpp
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('184a2651755daa64bb9ff13a07389443')
b2sums=('d4491309b8b7a5c4efba128e8064b8a8aba32b49df6b1add0ddea5c82a6b5d9880e3840f6b714b8c358b55b6c7a7933c9c499ccb7d2392bf95564790941f638d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
