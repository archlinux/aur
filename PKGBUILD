# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rnaseqcomp
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Benchmarks for RNA-seq Quantification Pipelines"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rcolorbrewer
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('83c1b04f775c91892a2629a3da5465b2')
b2sums=('a49d9a6b9368ac76e8ab824a7e560e5218a6ac3e0bd32a90f0a10878c3a1443acbdbff61ae318b03b59b31b7881677f2f14263741a6bb731a85a0d66476a6b3a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
