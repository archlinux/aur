# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=sched
_pkgver=1.0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Request Scheduler"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-chk
  r-fscache
  r-lgr
  r-openssl
  r-r6
  r-rcurl
)
optdepends=(
  r-covr
  r-knitr
  r-lintr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('12c143de647554440a0978bc9322d342')
b2sums=('37a7c90b6c7d1e9a0eedee988384e358c974deef2330ff537ce23779f46cf0c80519aacdd70eb5283be2d95ae616964a589d26da6461748fa59dd9b4d2575797')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
