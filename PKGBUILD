# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HDF5Array
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="HDF5 datasets as array-like objects in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  curl
  openssl
  r-biocgenerics
  r-delayedarray
  r-iranges
  r-rhdf5
  r-h5mread
  r-s4arrays
  r-s4vectors
  r-sparsearray
  zlib
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
  r-rspectra
  r-knitr
  r-rmarkdown
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2cd2344bb6c4db92c317b9af5dad2c98')
b2sums=('dc92517692dcebe01521dfe3313e7ad392e1eef4d8efd31d037b341fca9e3e3401f82657cb45306f2cf47d242f4b16ab2e2fdef11c9a81b2eeddd248497a4474')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
