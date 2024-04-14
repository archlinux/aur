# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=preseqR
_pkgver=4.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Predicting Species Accumulation Curves"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-polynom
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b85e80b8b229d743b67d36b312caa5de')
b2sums=('a51ee7519d162f26c2072f5665898943d5a988d87ef5e777bd77c36881fe55b56508d6a3c583c5ac8da4c770f21351e33cf55961341b786ae068ab5d63c4bf16')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
