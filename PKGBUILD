# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocVersion
_pkgver=3.18.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Set the appropriate version of Bioconductor packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('46dbe2f6ca9c058b24da1bd98f79631e')
b2sums=('ce2bad75517e08e4afc139058cbd63638e2e70ffe054eb439ae22a57e7241bcae2af033b84932abb404bee8fff9b51d5fe9be64c9de95da83da673400a2c15fb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
