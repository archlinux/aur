# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=minet
_pkgver=3.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mutual Information NETworks"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-infotheo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7b8067672f4bd2cbf7250559f39b7f95')
b2sums=('0191d1d5ae8e52814c07183e048979951271b3355f8939aa7b897ef6005883a0702fdc6009efeb85647c1d516f5d18e1a699cf7e5f014f5fcda85ab7e07ea564')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
