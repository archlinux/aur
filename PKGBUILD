# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=protoclust
_pkgver=1.6.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Hierarchical Clustering with Prototypes"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('06f3a4d3a917a49789c13bdc57424634')
b2sums=('d62d939b980a74beb8f526802c30d094d20d420d67e24dd061f13c0da0455aee4935f4d84392ac6c93a72386ec9893db4924478d578e88aafcb8f1d3a9a914ba')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
