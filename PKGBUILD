# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=sparsevctrs
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=2
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
md5sums=('917c2c8741eda7e703e7a30023d9e796')
b2sums=('8432d67d0a31de65beda54de49d6f24da7c40e990d69452705b4da5c011efa42c80e755e54bf907217f10308dd9f3aa27d96cfc96cfc7730abbf28d066350696')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

}
