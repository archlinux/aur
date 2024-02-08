# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=settings
_pkgver=0.2.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Software Option Settings Manager for R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e675298093ab60a9739fa5d99e070dd3')
b2sums=('a08ff9b45c323ffcd05d1a95198f07115e043680cd07d0e68f6b67ce7fae8b408806e84d780e92e43eadb0263da76e10fba842d7833cd54f9ef114c43e2f7d5e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
