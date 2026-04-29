# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCBN
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A statistical normalization method and differential expression analysis for RNA-seq data between different species"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d327263ed4c078a912417e65645683cf')
b2sums=('ae6adbf3bc94aab08003553e6dac38ad25b4b8b9a9e30dc3abcde0231cb5e2712e951cedbb0179e798423925d0bfe863a215dfad8fa0b101c02d752043b5f0c8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
