# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LSD
_pkgver=4.1-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Lots of Superior Depictions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aac68db34a6deb2d4e788749a54a9594')
b2sums=('c778fd41267bf27cadafa64592168063453589ab86abef786fde3e05f4e92120674e83e741a0f899eb2f2a7d6fc43c11d164289a95eda7b1a0acd02fb42955aa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
