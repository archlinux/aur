# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logicFS
_pkgver=2.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('af46ee02e89efc5057af01be3f530a4f')
b2sums=('0aecc6c7f84c73afd66e9165980f9de9ca2c59a5380b32375f3e6e7dc991041c54be69ae2dec7891c54abc18bc53b15c34dfe97cdcdf1f8daf7445bb2fde781a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
