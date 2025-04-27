# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneLenDataBase
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Lengths of mRNA transcripts for a number of genomes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-genomicfeatures
  r-rtracklayer
  r-txdbmaker
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e1460da5a597ce80521505e1e8087b8c')
b2sums=('a0d1ec5f98d2e6fc272821a3b4c82389811700cff33d0cdb5bd8c1bf14acd789c43efa303c53596f116f4fb7a6e627bb512cdc9b3e5686f97a78ff9e2696bec2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
