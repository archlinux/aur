# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=rBLAST
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Interface for the Basic Local Alignment Search Tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  blast+
  r-biocfilecache
  r-biostrings
)
optdepends=(
  r-data.table
  r-knitr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f626fea8919cb9febdd4e8272ebc76d1')
b2sums=('8f4a00881f64867aa8ba3d2834adf7c53ff38c438463b3bfa188b838f007e0ce55200e22c60982039f3b12f678511f4fcb24c4095666bb95e84678a364e5eb92')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
