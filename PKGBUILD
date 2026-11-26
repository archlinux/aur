# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqLogo
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sequence logos for DNA sequence alignments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d6db96ad822d530dceba28c1b7f0cab8')
b2sums=('7d0054c0250ee32140979568d5c3a1f47cc8e8d7e75f15744b8ee3aedaa158b2fa756547b533c5e7afc3f186459b4abaaf5192cf64c720e9824d37a82ea29e57')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
