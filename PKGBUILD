# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Icens
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="NPMLE for Censored and Truncated Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a9c2a7c2a240d00ef9baa1100daabf5c')
b2sums=('5cbaa23b8e3c2f51224e6f9c8c90a9b7139c950ebb33b285d857c379ec3604bd8cb1d5e18024a612803ccb5592dbccf2dbd9e874e460fd835f801161378a165f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
