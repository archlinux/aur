# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SamSPECTRAL
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identifies cell population in flow cytometry data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('03a6af6ace17bf38dd28410c83fb50bc')
b2sums=('8b82ad9fac392276490a40b4e1eeb88958e8428e774dffb545488b0443b66b005283d90f14294da995224eb09a8fbbac25c4e62723de9ec3648f4c2d5b894fce')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
