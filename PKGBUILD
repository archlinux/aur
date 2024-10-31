# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SNAGEEdata
_pkgver=1.41.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SNAGEE data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-all
  r-hgu95av2.db
  r-snagee
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1716ff61ce8f8600c37f90b5fe0df73b')
b2sums=('1142899dd3d0630ded3ae90d9bca3d59d0c4aefbe20d7fdbb3df0aa305de47876b0365c875f942907cccb28dbcb29ea69d6375fc83b915fcf28b71aac3534fe5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
