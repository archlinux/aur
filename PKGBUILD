# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cba
_pkgver=0.2-23
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Clustering for Business Analytics"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-proxy
)
optdepends=(
  r-colorspace
  r-gclus
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9033b1aa0baa6137fe64575dfbcd4ca3')
b2sums=('ba648b022b925981253e225fa1b4a18319186ec604fde5b962ca9849cb1222217b9048df57ac679cff7eedf416753e7f49d811c62cd8e7002b336c37b4644756')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
