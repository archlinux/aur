# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logicFS
_pkgver=2.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification of SNP Interactions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-logicreg
  r-mcbiopi
)
optdepends=(
  r-genefilter
  r-siggenes
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9ffa6da33c86bfd5c99cc3533f625298')
b2sums=('75f1568c92ae2093ab69976f2bfa11d91586d34b31e5b4611a8b200c57bd20a8516c4f37ab8b87cabb4bf3bee48722ba5fcd34cb2785d50f311a7489ffdc31df')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
