# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MantelCorr
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Compute Mantel Cluster Correlations"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7ef5ee0a329a4cf218c340e9289fea32')
b2sums=('3b7455388ae2f355e5334e7a236325310d4088e7ae8f8cee64d30037abc78f190f002fd2341807722e03cf85b52e717ed585d94c9aedc28354f08f54623481f2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
