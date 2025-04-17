# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DFP
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene Selection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('796f1fca3af13ad1a680f6cb57b38dda')
b2sums=('d7de9e87c441d220cafa3714aa2b20b12427b5c02a3c056fa025f08d651ad5d69ab92e36d446c80838b3a008a59fc1a9f1a1cc8da8d6f8dbc252462061cc8ecb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
