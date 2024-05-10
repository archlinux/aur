# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qlcMatrix
_pkgver=0.9.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utility Sparse Matrix Functions for Quantitative Language Comparison"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-docopt
  r-slam
  r-sparsesvd
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('29b54f102b72f2f2d8b2c015d965920a')
b2sums=('355187c9458f34bcfc0d1f5021c557abfdff6ba5ea0a42d79b6fa3e5a465596cf1d3bdd14dc8848ed63552bd1190a5641b102181bba9dfb0ebb8a73134ec226a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
