# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=comprehenr
_pkgver=0.6.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="List Comprehensions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('02f3c79d161b77c46295adda537a9ade')
b2sums=('808cc93182286ed4f0de2002c4537d5887dbceb2dc8f55ad6d61e2b739f618f529791915b603c49da478bf5eaec4062c7a8f6d18a96918c8e9fec59ac5c13539')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
