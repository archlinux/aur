# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=oaqc
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Computation of the Orbit-Aware Quad Census"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-igraph
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9340b95a6dca62c83f83ba05aa5b4b2f')
b2sums=('78bf4e22e91716133d28f99744aa711aea3a2533d4f24483d79928ee5ad7fc76746b9f233db43782ab159f0aa88f228bf1c87f869f9118c54092d6eb416755e9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
