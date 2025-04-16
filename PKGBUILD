# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BADER
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bayesian Analysis of Differential Expression in RNA Sequencing Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-pasilla
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('823e8d6323d214599ab6e675da1ba34b')
b2sums=('7c6807b0dc9bcbc4d1d1c6471996f6414f2f7da49c57689826871efd6833aa932a0f4599d2a15914c38f9f729d9db15221580f6d46a793f87e229de3b1eb6365')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
