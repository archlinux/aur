# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCBN
_pkgver=1.32.0
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
md5sums=('cca335ce977ccd85cab0876cdc2e1d54')
b2sums=('6a15f8e082126c301fbb2ce01127aab846b31edaed62272ffa3d4024dbd71c2d37444a605a6d03842a678be9d1480d27f5ba0a568293466a9aacc16172e09156')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
