# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BeadDataPackR
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Compression of Illumina BeadArray data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=(GPL2)
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b1e73395e4f18af4b799a1f447487a87')
b2sums=('52af55ac7067abbf25debad01d9dfd1dde91fe34d38dc227639cfed7296e2817e456bf2e72a8341c1f69308dae200feb8815c06f1a4e1a6ac930c43fed8b39f7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
