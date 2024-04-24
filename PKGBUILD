# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aplpack
_pkgver=1.3.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Another Plot Package: 'Bagplots', 'Iconplots', 'Summaryplots', Slider Functions and Others"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
  tk
)
optdepends=(
  r-jpeg
  r-png
  r-tkrplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b21426d7246139da14f3d6280b53ac72')
b2sums=('4982b442f4bdb3dd25ec916b18561599feac94839e1c107f930afdcb5b662dd6cdb04e730429fd1d67634d17da7d851d3e09bbcd0d3a3503c63d03775b0a5c54')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
