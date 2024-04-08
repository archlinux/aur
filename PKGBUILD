# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqTools
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('be9be6eb0ee1ff4ab001720970d68da8')
b2sums=('d813ac5feb6ac445a2462b4ac4aeb2c36837cb7101a210c64922561051b222c2c3126f11c1121f3a36e56a64fe903229a42495a72547ab7376ff1499ba2be96f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
