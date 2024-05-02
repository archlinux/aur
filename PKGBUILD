# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqTools
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of nucleotide, sequence and quality content on fastq files"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-zlibbioc
  zlib
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('efc46fe13fa6e36062e053a23245052b')
b2sums=('c88ac4dd281341db6a27a33f1c9d18feafc7160f32c7aa908ddb0bc72e884373ea2dc8667f2b193368b436476e26dd629038d41785164a7e6dc1670839e93daf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
