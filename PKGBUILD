# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneExpressionSignature
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene Expression Signature based Similarity Metric"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
)
optdepends=(
  r-apcluster
  r-biocstyle
  r-geoquery
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('31fb198b5f45021b4a52afe3b136efd9')
b2sums=('6bf5e93689643de97691c50e2185534f726c200423d662e6779dfe237917b953ff76ee18dc193ffa0e28731fe289644d0035bc7b10c27419984eadc5448d944e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
