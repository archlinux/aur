# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HDF5Array
_pkgver=1.32.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="HDF5 backend for DelayedArray objects"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  curl
  openssl
  r-biocgenerics
  r-delayedarray
  r-iranges
  r-rhdf5
  r-rhdf5filters
  r-s4arrays
  r-s4vectors
  zlib
)
makedepends=(
  r-rhdf5lib
)
optdepends=(
  r-biocparallel
  r-delayedmatrixstats
  r-experimenthub
  r-genefilter
  r-genomicfeatures
  r-genomicranges
  r-h5vcdata
  r-runit
  r-singlecellexperiment
  r-summarizedexperiment
  r-tenxbraindata
  r-zellkonverter
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4d0dbd18a165dac741481b197a632323')
b2sums=('0505e6b078870ffa826d3edf2aa8c89240dd9f3e88eeae52c5974ee50c5a101bf83c837da5e7c89cbd3dda0db00e96bc166a5b1924a7d69829d4dd87d9c81042')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
