# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lapmix
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Laplace Mixture Model in Microarray Experiments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c7c5fb52d888b23a23ba4049137cab60')
b2sums=('368f2fc45706a6c77c07481d1e54d9759390198caa2f702eb1315626869ce5c117dc7313d687915efe70248650f5b116d63d19af67808d06b4a7160c33a2f064')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
