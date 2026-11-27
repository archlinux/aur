# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDNAinRNAseqData
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RNA-seq data with different levels of gDNA contamination"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-experimenthub
  r-rcurl
  r-rsamtools
  r-xml
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('36ec4f102bdd757fcffc3b5e84c81574')
b2sums=('ccccbfa4aabc2c48eb189afd5fd2027d6cbcb3ef97729e53e865b1959ccad75b5c6c7f50139b9355043483fa696cfcc19b4ef73efad948d2bc8a0830aafb6478')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
