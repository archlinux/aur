# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=S4Vectors
_bcver=0.28.1
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Foundation of vector-like and list-like containers in Bioconductor"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=4.0.0' 'r-biocgenerics>=0.36.0')
optdepends=(r-iranges r-genomicranges r-summarizedexperiment r-delayedarray r-shortread r-data.table r-runit r-biocstyle)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('30839d2f118c91cf3638e15dfe5ef154fde90d79d6c0afe83b35e6ee34250e3a')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
