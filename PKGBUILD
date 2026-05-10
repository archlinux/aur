# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biomaRt
_pkgver=2.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface to BioMart databases (i.e. Ensembl)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-biocfilecache
  r-curl
  r-httr2
  r-progress
  r-stringr
  r-xml2
)
optdepends=(
  r-biocstyle
  r-httptest2
  r-knitr
  r-mockery
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0f6a3394158133b0349f56617b48c6db')
b2sums=('2070b8dbb4ad3d9f2eb6c5cf55b99e89012bd531900e1195fd5f35afaba18d443ba057d90b0eb05e6fafff1c65c86dd5db33101d1c3d68c75b14a3ac4f773aeb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
