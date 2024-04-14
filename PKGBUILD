# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LPEadj
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A correction of the local pooled error (LPE) method to replace the asymptotic variance adjustment with an unbiased adjustment based on sample size"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-lpe
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ebb9c5bc6d113688787fadb2739bc75a')
b2sums=('3ae835926e4b6ad55965ae6c67548fb9a935b0bec158ff1c59b7771428c441194a0b32fa457a8b4777d91d549ed1a0c751fe1dc7af59dd1a2ff0825f0abfd16d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
