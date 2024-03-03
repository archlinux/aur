# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=softImpute
_pkgver=1.4-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Matrix Completion via Iterative Soft-Thresholded SVD"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a17b4aafe9961e6af8f7808829459e90')
b2sums=('7284a66db4c96348a18b23603a56619fb5d8ad0bbf647446763b2d1910f22e1cd90d2b9f963472189c7d78fa0518b65ab58409359d68fe169b1b820099e5122b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
