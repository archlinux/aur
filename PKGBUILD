# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DTA
_pkgver=2.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Dynamic Transcriptome Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-lsd
  r-scatterplot3d
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('80978164209532213255a996f4b91b67')
b2sums=('ebc1bb1c5c1f4c78ef3bf9da1e42fbbd1055eaedd2c91d482d374866af45a92d60f825bbe499d2d3a2293dd605477dedb5c585dbd124b45416db6384dfb585b0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
