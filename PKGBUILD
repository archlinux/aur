# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TargetSearch
_pkgver=2.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A package for the analysis of GC-MS metabolite profiling data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-assertthat
  r-ncdf4
)
optdepends=(
  r-biocstyle
  r-knitr
  r-targetsearchdata
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7013b00950e240fcd7d53f0173d337e9')
b2sums=('340acf2cda0ea6d56a6ef1e70bea8a5b51bf2e41ed4107b1f146216e48f5677cbe39021038f82be986123973d53c6532c67ce2a43495d63aee26ea9f71814dd1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
