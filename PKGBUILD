# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqTools
_pkgver=1.40.0
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
md5sums=('ae732af0b68234893f0cb7852dbe64c7')
b2sums=('82d05b22acfbbe8218e2822ee9d92070cea46046a3c0f25d666f666c40d5fc67f506f8be3bf85eee71e0d4746fc63e8ac86fc35bb3077528a2cb76e357ea46ea')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
