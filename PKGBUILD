# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=ShortRead
_bcver=1.50.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="FASTQ input and manipulation"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=(r 'r-biocgenerics>=0.23.3' r-biocparallel 'r-biostrings>=2.47.6' 'r-rsamtools>=1.31.2' 'r-genomicalignments>=1.15.6' r-biobase 'r-s4vectors>=0.17.25' 'r-iranges>=2.13.12' 'r-genomeinfodb>=1.15.2' 'r-genomicranges>=1.31.8' r-hwriter r-zlibbioc r-latticeextra)
optdepends=(r-biocstyle r-runit r-biomart r-genomicfeatures r-yeastnagalakshmi)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('e372bcda18598826a445fc3116f7b226689e63fc717e680b0bbb40c306b7117f')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
