# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=runjags
_pkgver=2.3.0-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface Utilities, Model Templates, Parallel Computing Methods and Additional Distributions for MCMC Models in JAGS"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  jags
  r-coda
  r-rjags
)
optdepends=(
  r-knitr
  r-litedown
  r-markdown
  r-modeest
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ca664cb768059de1929a5cb66168d8f7')
b2sums=('a4144ef4580cb8dfb3dcc77e5ccffda05b7be66d6bbd2bebc272812cf6de0d65d56485f86686f64ea4a954d75122514c9e3544c821ff30926f3e9063766572ff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
