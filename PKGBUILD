# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=BiocParallel
_bcver=1.22.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Bioconductor facilities for parallel evaluation"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(GPL2 GPL3)
depends=(r r-futile.logger r-snow r-bh)
makedepends=('gcc>=4.3')
optdepends=(r-biocgenerics r-foreach r-batchjobs r-bbmisc r-doparallel r-rmpi r-genomicranges r-rnaseqdata.hnrnpc.bam.chr14 r-txdb.hsapiens.ucsc.hg19.knowngene r-variantannotation r-rsamtools r-genomicalignments r-shortread r-codetools r-runit r-biocstyle r-knitr r-batchtools r-data.table)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('4fa0a5f777de5c9cda96cfe2e93cd34f2686df84bf4507cc2c9e0e596a2f4fd3')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
