# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneClassifiers
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Application of gene classifiers"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5ee2b56df68f8bd39a2ec02633372e04')
b2sums=('909397470d3640ecf6e4462815295ad865a883c40001b1d9846778417d8753c6285d3882c338dbff2f5f8bf1672042cb0909c058a16c63abadc15dfc4175370d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
