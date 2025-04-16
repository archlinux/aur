# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KBoost
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Inference of gene regulatory networks from gene expression data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('81b0efb224e5a2682249c31ee8e0a665')
b2sums=('a15db0d153ba4c98db8ad965c85d4c64ffe6c8785fdf79907e6b71a557a264c68059f05e2f5a6de4e4bc1e9aacf3e4ec85ec4717d9c269b437c0e8e21387a929')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
