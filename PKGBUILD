# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=harmonicmeanp
_pkgver=3.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Harmonic Mean p-Values and Model Averaging by Mean Maximum Likelihood"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-fmstable
)
optdepends=(
  r-ape
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('04b40580684b0c072b43387b1c98518e')
b2sums=('3745b21216b494c6589b212a5e0adf4e37483494b2329df9e211d0258791500e0762b212bd09c68531072f4a5ab4dd85b67bdc0435e0962c8b0c735bbc042dae')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
