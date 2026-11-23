# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=deadwood
_pkgver=0.9.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Outlier Detection via Pruning Mutual Reachability Minimum Spanning Trees"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-quitefastmst
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3c11f155cb190560c5665cb915269f02')
b2sums=('bf66a7577d9d71dd3e26e809db8481faa959ac562de45e1062061a2202bb37cbf4aa51118fac362ffb1a015db7bf54abf7a66ef31a0a040a80ea59693baf8ee8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
