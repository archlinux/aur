# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KEGGandMetacoreDzPathwaysGEO
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Disease Datasets from GEO"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3150ea9732f366cdd554930f0e065a53')
b2sums=('a9dfa9d05c721aaa41862f82a860cd11639bfcc83dfaf82f79d93300fc5f410e7d09945a56bd1019e641408027a98bba9971451d69269578563cbe34caaa23fe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
