# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DMRforPairs
_pkgver=1.35.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="identifying Differentially Methylated Regions between unique samples using array based methylation profiles"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-genomicranges
  r-gviz
  r-r2html
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('692e267e169e89a0bc8df8f91e433bbb')
b2sums=('10f56ae566377958bcdf9f7c80ae1182d94ee9af43304f7a16314850de0a85b8df5e928ba4b33f997802565ca07c11dc5461fb74574d784fec935e43f9e4eba9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
