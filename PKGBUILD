# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EGSEAdata
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene set collections for the EGSEA package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('CC-BY-ND-4.0')
depends=(
  r
)
optdepends=(
  r-egsea
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4cccea0a97382fdd3259ada84ed54a2a')
b2sums=('565a8d6107c8a172020543970102d090774c7f12f5d6936e0dfcc13513cbb1a07ca6e25ed6490f37b6607b06d3cb1d15762863b400809b3b464119f17f4ba0b3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
