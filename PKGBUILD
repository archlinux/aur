# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=survPresmooth
_pkgver=1.1-12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Presmoothed Estimation in Survival Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c5a95515225f6aebfd40ae8999dbb34b')
b2sums=('90cb98bc03eaeb889ee5c6a87b4e7c37d22b8265292bc0b8e74eb5cd8a6e74a6dc8947cb7643e37575309fee58fa5e6e33494494fc491e31b54b80998e4bf634')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
