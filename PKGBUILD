# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RnBeads.hg38
_pkgver=1.37.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RnBeads.hg38"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-genomicranges
)
optdepends=(
  r-rnbeads
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dbc8abc238802488228d42ee47c39845')
b2sums=('6778e089911f57ed504c933bd4c09df1cfea34ed9d48c61f8d3b0f481a1b9b09ddc35a4622b6fe3a72d9539fbc3cd62efa21e7bad40224c22c4fb77b9cfd1b93')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
