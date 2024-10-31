# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RUVnormalizeData
_pkgver=1.25.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gender data for the RUVnormalize package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fe09e6af327073ba7e19f58725413287')
b2sums=('65d249f27341e0af702aa1755592ab71797650481f30eb163767980738b0cfe2eea1e48270c7bb5d636546b9fc3f2ebca49301bc73cf344f3435aa93513396fb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
