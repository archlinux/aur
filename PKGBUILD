# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCBN
_pkgver=1.24.0
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
md5sums=('091087bd3f6adc46eb6cd1ee2ab425c2')
b2sums=('7697b87f58ee37e0dfa068017139aad11e91d5b29dc7343f588796add73cc442544fa1a23b4ed9e7548edb8e58e57826f611a7ae197459dc75fd3108fe897e28')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
