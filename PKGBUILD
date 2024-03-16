# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pinfsc50
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Sequence ('FASTA'), Annotation ('GFF') and Variants ('VCF') for 17 Samples of 'P. Infestans\" and 1 'P. Mirabilis'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ec89a5a85a4c8975899b704b19acc1cb')
b2sums=('9c316c3b090141327d2f53bef77eafdd6a6f9d0cbd19c8b650b54635f2f6ac57e862db2bf21bf1c7622fdc927d5638ba5cda66539291b55ec68c12b7e6ebe046')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
