# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=additivityTests
_pkgver=1.1-4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Additivity Tests in the Two Way Anova with Single Sub-Class Numbers"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9ebfdadd8435d3597c120f6aa5d8a621')
b2sums=('e9c6b9ae13be1ff34c10ba10109181db921c0b46f73d847f799a57496a6b4fd5e78c21aca069689fa1cb50ee8c8cea7297bef64410c5896884b74bd84ba82f22')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
