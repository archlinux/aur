# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maigesPack
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Functions to handle cDNA microarray data, including several methods of data analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-convert
  r-graph
  r-limma
  r-marray
)
optdepends=(
  r-amap
  r-annotate
  r-e1071
  r-multtest
  r-olin
  r-r2html
  r-rgl
  r-som
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('118a586912fcef7e97526e4b2d142729')
b2sums=('925b4e53286ce1b90690e3e3a278a10bc5980894e2f49a4e26a187402af15794bc096eebee2d923ea2ade300f399cdae3159a068a889b808834c90db6a04e2e2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
