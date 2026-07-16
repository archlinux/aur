# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=minfiData
_pkgver=0.58.0
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
md5sums=('968db10003339d810f5ec0b6a83a6531')
b2sums=('3797e2152a739293d88108042879f08cd4b9b5bb5301ea5f7a1c284611cc7e83f35d38dcb1e94d981de438147cbce46a44c03a5f66b3c3d8c868237be26d41c1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
