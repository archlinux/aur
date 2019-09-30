# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Clint Valentine <valentine.clint@gmail.com>
# Contributor: wagnerflo <florian@wagner-flo.net>

_cranname=lubridate
_cranver=1.7.4
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=6
pkgdesc="Make Dealing with Dates a Little Easier"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r' 'r-stringr' 'r-rcpp')
makedepends=('gcc')
optdepends=('r-testthat' 'r-knitr' 'r-covr')
source=(http://cran.r-project.org/src/contrib/"${_cranname}"_"${_cranver}".tar.gz)
sha256sums=('510ca87bd91631c395655ee5029b291e948b33df09e56f6be5839f43e3104891')

build(){
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
  cd "${srcdir}"

  install -dm0755 "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
