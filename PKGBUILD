# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=reformulas
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Machinery for Processing Random Effect Formulas"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rdpack
)
optdepends=(
  r-lme4
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('77ac03912efe8d7bc435117e80ed157f')
b2sums=('49faf0ed3bbf5c98c129270d8d736e3135f70b1cbff8ada26d4674da86203072f641ae7a17f43349506cff809828ee7e151d5208e3d69ce13a14c2ebcfc95c31')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
