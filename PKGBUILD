# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=speedglm
_pkgver=0.3-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Fitting Linear and Generalized Linear Models to Large Data Sets"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biglm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('48a7f9d2722b0142fc0372a6d8769acf')
b2sums=('90d883e2ed6c6de16c08bf24566cd347e4fe6f5a47389a38913c012723e59813c461fe1b8a94757c0739593a4a58dae8664ee07e8c6bb1f9900080494ec0c971')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
