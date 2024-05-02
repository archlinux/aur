# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NeuCA
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="NEUral network-based single-Cell Annotation tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-e1071
  r-kableextra
  r-keras
  r-limma
  r-singlecellexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-networkd3
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7693089490a5d1e3dc59f7f1295808e2')
b2sums=('823f237351eed7cdba3597c9f2e30bd7b9a11b59ff3752d9431538b1be169eda1a4cf91a61e2951d4ed0447ecb69bb15ce9cac9f65e690886b180ad86c7b466d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
