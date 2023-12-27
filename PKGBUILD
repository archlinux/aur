# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=squash
_pkgver=1.0.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Color-Based Plots for Multivariate Visualization"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(Artistic2.0)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1b89b5972d72f95b976f0deedf50c2ac')
b2sums=('1a5d3e78279986ce97d719ebe48e75de3dc0e59020c377640e44d8091173ed948950d79fcc411b15d5a364995e8607a121b3e8034ee51ca600b6f8381905dd33')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
