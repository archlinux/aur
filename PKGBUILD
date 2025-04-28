# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nullrangesData
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ExperimentHub datasets for the nullranges package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-experimenthub
  r-genomicranges
  r-interactionset
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('74717a562978e47cd32e954ba63889a6')
b2sums=('aa7c37716c4e72bf7fec3a227e85b6360b9ff4be7269d73ad7c03ed1ab1bec8d3fbd03104f05e7196ef2575c1a64882b19fb21c579f69d094374d0694ff074d5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
