# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pwrEWAS.data
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Reference data accompanying pwrEWAS"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-experimenthub
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/3.17/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4bc800d4a20edec551cbbcbbffd3d107')
b2sums=('e40e058ce5f2038dff62ee3f4ca36ee67dc5545711643277ecb28156874674196396d716182a7949445485611c4d42fd83ede61206dd283b2e26be76fc782f81')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
