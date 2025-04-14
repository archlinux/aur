# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=sparsevctrs
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Sparse Vectors for Use in Data Frames'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r-cli
  r-rlang
  r-vctrs
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
  r-tibble
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('325a2f12796bff6d08a6503cdffb00f0')
b2sums=('71e5ae89c8af45aedc45bc39ad87f128c7d00840d86ba21020144e22dab34c9d830e54445b4a9b55c413f1a2c7ed521411c9878e81cf3cde13f921405b9ba165')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

}
