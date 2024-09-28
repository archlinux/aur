# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=rugarch
_pkgver=1.5-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Univariate GARCH Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-chron
  r-fracdiff
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
  r-rcpparmadillo
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e83f2dd5f0fd82ccf95ae284891460b9')
b2sums=('d358266623696cd7a126e53666bbc5efbc7fc7db14a8d29a3d14380d531795899e038a56db20a761fc135dd9d9147f8e0c42176b483b3b336dbea24b36309170')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
