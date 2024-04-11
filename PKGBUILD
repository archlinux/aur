# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kSamples
_pkgver=1.2-10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="K-Sample Rank Tests and their Combinations"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-suppdists
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b3f45e87748adf618c76c59740fcf3f7')
b2sums=('e9ed5b3adc7185061fb32fcabf09e2d6a396c4072c88f210669bb49aaa5a0254fca096180601428992dabc4a151a1016443024cdfdcd2390c2773fd01d46f958')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
