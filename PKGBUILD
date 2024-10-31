# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genefilter
_pkgver=1.88.0
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
md5sums=('95bc8cdec8e895d1f36507ace3dc0b3c')
b2sums=('20871180b864cb3458908a45fcb65a4176621deb76ced9953ee0fdfd21998d275b2c7be8c09a2d3f19373f734a25f0a206b6205fbe94cc6b733983de7d8e676c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
