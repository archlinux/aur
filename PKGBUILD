# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=BiocBaseUtils
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="General utility functions for developing Bioconductor packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b966ed39fdb2cba740a934e76266327b')
b2sums=('4921773913d0df4eb9a51901c9ed1ccc217180c80a1be03d9ef7b78542f31e6b61f065bfe04ba19e632317030f3080478bf1b91bf57178fd0de95e800e6b1ddc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
