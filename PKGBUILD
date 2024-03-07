# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yaImpute
_pkgver=1.0-34
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('d4e6899077278d5386b0063a2d4be696')
b2sums=('6b21c59b068a7efbc76c5f490d820b1e0f5dfce428ee155a10e33705ec617384740f883a2d6215c66901649af585706b36b84d87add7043b8a2705b53a2647b8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
