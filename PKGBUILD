# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DFP
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene Selection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('775b3ef899bceea21c54583523c32585')
b2sums=('0d7d31c91dd38b4b48f0023d23e65ff6379332c9c77b77d535ee0b17b18c65db300385c463c22faf9b3dc6169bb5b5ee739cd5a422c6ad9c7651540004e7ffed')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
