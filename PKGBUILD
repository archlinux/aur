# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=a4Reporting
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Automated Affymetrix Array Analysis Reporting Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-xtable
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ba7f3c5606c2f898d84314ba63208fa')
b2sums=('4f009ee1c65c7d25b4e3fee5dd2bb70aa5ee9a4591d1e4ead220f5716a6ea4749be2d059637ce8018fac0b21e0967a820d576bb572f915410d5ab6f63c62aba8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
