# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yaImpute
_pkgver=1.0-34.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Nearest Neighbor Observation Imputation and Evaluation Tools"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-ccapp
  r-fastica
  r-gam
  r-gower
  r-randomforest
  r-vegan
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1db986dbdc7844996a0c850485bc59ee')
b2sums=('100ae2827ade6a83b1e51bf05866cfc4474adc8a6eccb42100ddb94d5a040a621e17c117af4dff4b2d5ac96d314d8f1231eefea7a1d17bf0d92d4c2228ce9886')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
