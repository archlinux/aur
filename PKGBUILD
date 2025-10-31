# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ProtGenerics
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generic infrastructure for Bioconductor mass spectrometry packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('096214a880a202170f14a2a72155a234')
b2sums=('0d42ac206fd232409ded464e8605791cdb346050ae9dd369c3794dfc14f10ab593d99ea659acad67c27f073a9bc95e51f254cf75ee3ead6c363dca80cafe50ed')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
