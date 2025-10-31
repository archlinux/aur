# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spikeLI
_pkgver=2.70.0
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
md5sums=('8ee55371b7e195c216bdd219f988aa98')
b2sums=('3964bc0419c6f4f72a7b31b988befbb5a1a3bcf4fccad0499ff7ca397c6e16727c21e46fc3eaad17be8e6b021b7f84557d4ad8b86ae253f0095ba7593ccd54a5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
