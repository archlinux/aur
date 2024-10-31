# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=a4Reporting
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Automated Affymetrix Array Analysis Reporting Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-xtable
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9c1304a0bcbb5f174e3d4d3a59870d87')
b2sums=('7060e97fddf11cf9d567f542cfdb76be376d0b02d758df3ab5046167e03f3bfc84ec654aeacd39bd5a0e6057034bd60a3d53cd8dc9e40c1f6e1a6698e435777a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
