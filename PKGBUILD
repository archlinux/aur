# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=minfiData
_pkgver=0.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example data for the Illumina Methylation 450k array"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylation450kmanifest
  r-minfi
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1ca7578aeab1a54db146c443870be6e7')
sha256sums=('885fdbb81ab221226fdbf6f807efbb19854cbe46d5fd60f6d177a3f5c7f6908a')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
