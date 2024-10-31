# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maCorrPlot
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualize artificial correlation in microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('131553e83d70b83c6770f29d77850e8d')
b2sums=('a63de31a959a91b7f2fac78288a81927fc2b4e47a95ed9f453cd9a878892446172ae55cb717457fdd6ab5d18d3a6482cf57b0c7780807e89be15d1637897e978')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
