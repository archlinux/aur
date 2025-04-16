# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqTools
_pkgver=1.42.0
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
md5sums=('06219744fc94b56f72825fa5f438e1c8')
b2sums=('6df7bd2a363400b333c514b19e02f9840e8d64229101a8d42d92be08752ee3708c783a19cef89a74ad83b33645bad05d8b6e356b53411bb11751479475738c98')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
