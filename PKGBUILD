# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SNAGEEdata
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SNAGEE data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-all
  r-hgu95av2.db
  r-snagee
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ad1629bee4e1cb85c3dfe006369b272e')
b2sums=('060b26a9edea78c98a8c5141f7a71c2916747e0bdc0394bea33be535bc96fa4599f7f33c9f6389efc153730b49922894aa5dc115f911c74fe6a788699fcb876b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
