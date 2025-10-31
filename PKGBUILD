# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCASPAR
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package for survival time prediction based on a piecewise baseline hazard Cox regression model"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('967a86132f7c2af760b1812d71645aeb')
b2sums=('caa4e8708501a18c8bbe228e8f4c6e74f22283abee3ffbc4064ff89e04a6fd419c8a4095332705521ef72d38f13b17a4ededf041916397dbe4ff29ebc63db5b7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
