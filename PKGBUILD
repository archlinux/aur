# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=poilog
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Poisson Lognormal and Bivariate Poisson Lognormal Distribution"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e3eaf4f8caf52dc896096364e3de4dee')
b2sums=('2cecb56a7ceddd9da97122e21fcf4ff441fedebfb480ca2bb4f4aeb1d0f562ad5f7dfe5d4956bacd0b5cd4da4939e1dae65b3340aa37f7fd6de38e7809b91735')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
