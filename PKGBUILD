# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=minet
_pkgver=3.72.0
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
md5sums=('710eb2ee071ff99cb79a50aef33f8b49')
b2sums=('6b81fb795cfab49bf9fbe2c3762c19b15811e8e6b5d39b7af060d020d9911232308ee83528adc6fb8c71ecdd01bb5ece26e3104325717587b223ceb72a381180')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
