# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fdrame
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="FDR adjustments of Microarray Experiments (FDR-AME)"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4c0bed12b12d47a2079deb23c5e29160')
b2sums=('52fde26cd304a5bdfd7836293f4601299d0068e07b90c6093a894805a8f114bc6be02812f4277f98a48e38e45afdcd67b2d91795afe7dc86d6f72187eac57a70')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
