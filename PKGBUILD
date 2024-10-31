# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RGSEA
_pkgver=1.40.0
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
md5sums=('08b1d6a2df3449e12fe7d0358fb62404')
b2sums=('cf11987701f908908b646db601419c097bb9b168bd5f9e3a3e7d09ecf6b263442423940c96ddb0e603731f340666e71b0a4504e69501b14ddc46dc0b45a079ff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
