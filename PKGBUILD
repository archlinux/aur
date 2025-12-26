# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genefilter
_pkgver=1.92.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="methods for filtering genes from high-throughput experiments"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotate
  r-annotationdbi
  r-biobase
  r-matrixgenerics
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-all
  r-biocstyle
  r-hgu95av2.db
  r-knitr
  r-rcolorbrewer
  r-roc
  r-tkwidgets
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('06c2d7996767eac12666bb4e6e3cd584')
b2sums=('d94c4718aab0827c2b7f29c9ce5acde8c652a609fd9c922f6a6862bc08b9189cc991a2f590e2d029bc607ee8ba89a6e7c90a0da7eaecea89dcf002a3f764cdb5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
