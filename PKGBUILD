# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=UNDO
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Unsupervised Deconvolution of Tumor-Stromal Mixed Expressions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
  r-nnls
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a94665c036a09fbf3728f0a1ad220dfa')
b2sums=('06d24ea76e21b19d94616e038a524e32612b9c1fe528777084e1aabf88d84456ca7d9c8c923b6ea2aa181d89254cde3c83ccc9eff4aabae3977314178fc95623')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
