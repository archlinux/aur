# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spikeLI
_pkgver=2.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Affymetrix Spike-in Langmuir Isotherm Data Analysis Tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ed4042921be4030d00fee6fee87a5a69')
b2sums=('ea423e8d18415b4b6eb60740f767b49d4a9f2366314477e93d9a6d5e8c3dac05cdb9e255f62dbe181a0ceb6c44a88d7124f91a62344819fba38d76cc07305645')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
