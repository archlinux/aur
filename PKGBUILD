# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iSeq
_pkgver=1.66.0
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
md5sums=('4b0f37cbd02ab715e0ebe43fe1f7cbd5')
b2sums=('01f0a564045f63f9462095e9a2114ba52cb3003142903c6bcab3d2801a566b5d5a4014c5d85847395e54e688fca071eb93a28a0824931a347415cc48d5c30cb6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
