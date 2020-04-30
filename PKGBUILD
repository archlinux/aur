# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=ShortRead
_bcver=1.46.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="FASTQ input and manipulation"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=(r 'r-biocgenerics>=0.23.3' r-biocparallel 'r-biostrings>=2.47.6' 'r-rsamtools>=1.31.2' 'r-genomicalignments>=1.15.6' r-biobase 'r-s4vectors>=0.17.25' 'r-iranges>=2.13.12' 'r-genomeinfodb>=1.15.2' 'r-genomicranges>=1.31.8' r-hwriter r-zlibbioc r-latticeextra)
makedepends=(gcc)
optdepends=(r-biocstyle r-runit r-biomart r-genomicfeatures r-yeastnagalakshmi)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
md5sums=('1cb99240a3a440c0d28282f50b66b1a0')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
