# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSALightning
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Permutation-based Gene Set Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-data.table
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c554739e35a837dc7b9d2bef564f3aa3')
b2sums=('2f6ba88ff8a77de9be5b2f0cbc791800b42eccb41b2d0059c0a139f92bb49490aaf1b965092504a6a7bf3d195e20f73c406efd1f912aaead432a414c31bc77e4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
