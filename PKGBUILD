# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffGeneAnalysis
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Performs differential gene expression Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-minpack.lm
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aa3d8c4ce3b83b8a6f02e87384dd649f')
b2sums=('4798c74c8fb60c169dc7d7aa5ff3102cc38cbf066146ad07d8a68a104147c176b9c632ea7bb084d4fe4dd036d6d39b73d5e4bab76926964f6489ea7248d62ddb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
