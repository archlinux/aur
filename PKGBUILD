# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=sciplot
_pkgver=1.2-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Scientific Graphing Functions for Factorial Designs"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4510ec33ecf0da8d371656de67e2db83')
b2sums=('ff76873e6292adef8d0fbed01d85488790d6a1ae599a1e0d929a2661c0d675dfa68512b9e7a8c533a70b4160c213499c9950a52fbaadaf00a0c28dcff4b97d02')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
