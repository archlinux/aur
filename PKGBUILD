# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iSeq
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bayesian Hierarchical Modeling of ChIP-seq Data Through Hidden Ising Models"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6481c80648649279a6d158ac2946e61a')
b2sums=('a80c28f182540204d86c402ae12c2f8e2cb7f59058d6a5ab08b447cb37250a19adc8ecd420db927c639bc684e11e894ed0419070668ed2f19bfc4d2ff3fb5acc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
