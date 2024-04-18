# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HELP
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Tools for HELP data analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d7a1038ee6eb5ec01393b39e30e028fe')
b2sums=('ca5a120a258060f9adc22f4903a655861302e431ec20caaf8f4863025b609c8589f2fa70c390ff8b837f0587ddf028e0569b6fc088c5c47793e7d64b9886b7c5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
