# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=psychTools
_pkgver=2.6.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools to Accompany the 'psych' Package for Psychological Research"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-psych
)
optdepends=(
  r-gparotation
  r-knitr
  r-lavaan
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c15f6a3993ff2313702970acec5319ca')
b2sums=('a525ea93b3035c6782cf68e0f833611d5b9da293dff30ff61f080822a9cdc4e3c515fa1763cddbae0e87134c0a4d879a98456d83bbaa7dee3ee3055ae39717f3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
