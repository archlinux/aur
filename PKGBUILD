# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ProtGenerics
_pkgver=1.46.0
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
md5sums=('140f89778afc828597f555a91e0b3340')
b2sums=('f9a66e46bba1137ee4169df72e1e6722ced066a2d9ad08ab55ead73bc464af361dfd908ed04c93574aee50b2d7b398ad6ab661776565be28c30ad81c5e60160a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
