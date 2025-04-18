# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HSMMSingleCell
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Single-cell RNA-Seq for differentiating human skeletal muscle myoblasts (HSMM)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3deb4aa5d79124c165d0ad7e70855864')
b2sums=('e009d31cc013d35e98796ac78ec13d6e5225fa427fa54ab19b6ab4fcfa1c06ab65376f7c65d84e2ce152b85753fb463ae9415e612ef6a85b44f5a1d1f53b03c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
