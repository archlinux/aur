# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fdrame
_pkgver=1.77.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="FDR adjustments of Microarray Experiments (FDR-AME)"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c346b1866598cdb4b58dc5658b3a7eb0')
b2sums=('5e911d1cfb85669c54bd7f6002fb9b7af5ee508f3382a9da56f2bdc069db3582c5c3fc7f0607d1d99e1f78a241039846c29e1a89303eaae012f1e2c398946868')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
