# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=minfiData
_pkgver=0.50.0
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
md5sums=('1690dfe4d1ce4f49cae6078d0afe50aa')
b2sums=('caba0d05d3e4d879dd3dfb5d6288dc9c75326a3f13f720f2ff86a785b2475fa352513013633314c68c186fac9f48fde228905832bb779944d9bf613f13cb3ae0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
