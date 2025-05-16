# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MetaboCoreUtils
_pkgver=1.16.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Core Utils for Metabolomics Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-mscoreutils
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-robustbase
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('57a1cba82b0d69d9a9bd866a1dc590af')
b2sums=('cc729d83e21c083569df545e624adff856d39e82a3aa25533902b3f85db0a5a78a81822fca7b22d5be466ae80217ce9ed67068f6509cbabf2884497cf7c935e3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
