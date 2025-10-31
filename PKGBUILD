# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReadqPCR
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Read qPCR data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-biobase
)
optdepends=(
  r-qpcr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1a1b8ef409cb97983cc7bd91fd0040f6')
b2sums=('fb20a577f3c8afb6cb43dd17b5205914cc55a0cadae8cadd9cf46beacb2f830223223edaee903af3a396636d6f92d97429b96d9c3e94125e27a5a00ab36fbf27')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
