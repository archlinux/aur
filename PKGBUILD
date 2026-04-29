# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RGSEA
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Random Gene Set Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-biocgenerics
)
optdepends=(
  r-biocstyle
  r-geoquery
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3eb591c74979d567dd48be563ee540dc')
b2sums=('aabd00ece4ad228d6ff0349440274a7b69245a1dfd2357a1e2635d6d5c02eb073aa0563261c4148ffac92576903b952d5fe406fd3fc5c661836906199f138a45')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
