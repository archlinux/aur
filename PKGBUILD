# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BeadDataPackR
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compression of Illumina BeadArray data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('63023a2f3a4e09ca1f357570eda58adf')
b2sums=('f9781cda170d1ebf6fdece22acb0ac53829daaf363d666a56f378a9ae2e12fa729088da88ac7b16648abd36ac8271f1a1ad02a1153c04d47cb4823d8d3eb8ea1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
