# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=INPower
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for computing the number of susceptibility SNPs"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-mvtnorm
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3970fbee033347e77144646d9e60c4cb')
b2sums=('381d75ed55d490c3c9a3b4a4769a49e52f0770c450f1470104c372a7a0dab17b4c98a5b8dcfca1041fdb30b1af3d009361551e2ca4085b048a24fe740e858e82')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
