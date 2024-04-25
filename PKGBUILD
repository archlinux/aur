# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=rugarch
_pkgver=1.5-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Univariate GARCH Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-chron
  r-ks
  r-nloptr
  r-numderiv
  r-rcpp
  r-rsolnp
  r-skewhyperbolic
  r-spd
  r-xts
  r-zoo
)
makedepends=(
  gcc-fortran
  r-rcpparmadillo
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('98d9cb00c50db386ca21f716656df2b6')
b2sums=('7b10a89b3709e56f38b5060064a2d654d3c2b8103ee2274296b961eaf1e8c7cd24c99ec3817485240cff0bc5703cbdd007b564ce9ecf37ec964ed0ffae937a78')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
