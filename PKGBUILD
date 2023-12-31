# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rhdf5lib
_pkgver=1.24.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="hdf5 library as an R package"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=(Artistic2.0)
depends=(
  r
  zlib
)
optdepends=(
  r-biocstyle
  r-knitr
  r-mockery
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8ff63f889952862ce7e1a5a55d693655')
b2sums=('4041fc6101094a3861b188f19a2468b23b2131f906cc45cb83dd9f998af0396906856d1c2f25bc8a6f60ae35dcffebf6b321e04f93e2a0d58f431e61892bc9ee')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
