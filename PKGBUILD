# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=minfiData
_pkgver=0.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example data for the Illumina Methylation 450k array"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylation450kmanifest
  r-minfi
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5a8376e4b2beb90e49335d7fa11cbd5f')
b2sums=('34f232a175dba384d88d7e2917dd6a5df215169d48c36281b975141dfffa11faedae8a766506099e55a1658a8bc4ea3c2d1ed8609fe1e3340d9b7c5cbb328aa7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
