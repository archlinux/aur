# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mefa
_pkgver=3.2-8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Multivariate Data Handling in Ecology and Biogeography"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-mefa4
  r-vegan
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c6ab090090a592167dd5ead38703e19b')
b2sums=('5a9469896668120e78017f20dc1c431fc20fccf53764761ed72b6b1e304bda7fdbe969d9f886ec5b87e1ac4647345ed5e61861d475d5b0c92b6a4c5e517e9f5f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
