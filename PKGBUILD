# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=antiProfiles
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Implementation of gene expression anti-profiles"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-locfit
  r-matrixstats
)
optdepends=(
  r-antiprofilesdata
  r-rcolorbrewer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('80b3c1174d02d3b00b3ebf5d14a75b90')
b2sums=('1276bd63c8b0d06058a337a41fd1eba7946847884932d004d7dc026d40e065991c63b45c4aa2241ef91441223b88c0077dc3406dbe4f744450ccd457623bb9f3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
