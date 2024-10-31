# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DrugVsDiseasedata
_pkgver=1.41.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Drug versus Disease Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a9c385803ec91e51aaa67286303e2d97')
b2sums=('d16e662a62036bec2780964f8b17c68867ce14155be9be5c91be4a2a2bc059516654dcedfe399a05182878f58560059cddfb44381cd49d2ad55447a34d418e7d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
