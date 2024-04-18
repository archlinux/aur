# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=randPack
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Randomization routines for Clinical Trials"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('71791ade28f58d981a510c8b660ae1e7')
b2sums=('f7ad40bdd70925b5cfa11c5befa3362232eaa79424401b4803b049d02df9f48ab20a6d95d0116c47d1cab39009b3f7427fdd7681933e6ca0755a484c13c954aa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
