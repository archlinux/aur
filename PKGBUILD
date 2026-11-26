# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BADER
_pkgver=1.52.0
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
md5sums=('eaf9abac612fa5631978d580a945d8ff')
b2sums=('9dfef7ac8632559e6bc39e7d34a5af874d7591caf8b3d4b156faef8ef6f6730589ea0ae83e77e0bb1f302f2dd8a3a6489266496eb4efbe268fa9a3f2f6c6253f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
