# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NTW
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Predict gene network using an Ordinary Differential Equation (ODE) based method"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-mvtnorm
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c64df447dfa43cbb3bf97922655ff516')
b2sums=('e053bbce5a43f2828d7dc5a7ab6d92d00b919089950575f33cdb66618a46e0c7b57e56382086307b294b54640537fdba4557ef0b6b3fab041d50c35f068e8e02')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
