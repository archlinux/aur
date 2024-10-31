# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SNAGEE
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Signal-to-Noise applied to Gene Expression Experiments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-snageedata
)
optdepends=(
  r-all
  r-hgu95av2.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ca322a39ca0a32a55a45b53bfda91db9')
b2sums=('330d84eddd316bb0c431d1dd54c6c6affcf34893a6062772e3f081b2fcff374a176ba65757d9102200450c602c7ad69792ed65027b436ebd52b3f57975b842ee')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
