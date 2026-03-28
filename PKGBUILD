# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MuMIn
_pkgver=1.48.19
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multi-Model Inference"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-insight
)
optdepends=(
  r-gamm4
  r-geepack
  r-lme4
  r-performance
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a261798532039baee2b4dabbac5cbff9')
b2sums=('55add4457d6901dd30daa3d60fc3a8619b765aa2dd16aa3e88b7232fccfbd39e3fa6bddf55f600ddf3bcddb332ba72c9042c02eeb48944dba99178a71e86632d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
