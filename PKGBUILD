# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nullrangesData
_pkgver=1.12.0
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
md5sums=('5fc9168190de6f06922ed63027aba161')
b2sums=('272e54f63231c87b53e13ad1ecf9eb0fa4a705f455d448ad8139f1118ce07eea1ed1b46f4966e3e3e4cec3a702581b8cb5a91e7c99d9f6d786df020e0bc6a89b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
