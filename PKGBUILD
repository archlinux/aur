# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OnassisJavaLibs
_pkgver=1.29.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="java libraries to run conceptmapper and semantic similarity"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-rjava
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fe60eb8a03c2082b5e914ffe30d0b929')
b2sums=('2e1bda515edec86193d5da41f7202fffa0ca0b706a8136d8368bc96eb938bf9f9f42e0d3bc16de17f1a4e85cbf9635a5b49a672c2b4fb93e73133d80df050aa6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
