# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSALightning
_pkgver=1.42.0
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
md5sums=('5de08117a89c274a8dc51ee9a7cad4c0')
b2sums=('aa572fe55ef3d40074f71f7132f0d1eee10a8c53de45396e827ee30170ca0ceb4ee682990bab595b365235e392ee6a439b1cf0f69ea2396b06c7b6cfe9ad978d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
