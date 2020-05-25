# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=XVector
_bcver=0.28.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Foundation of external vector representation and manipulation in Bioconductor"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=2.8.0' 'r-biocgenerics>=0.19.2' 'r-s4vectors>=0.25.14' 'r-iranges>=2.21.6' r-zlibbioc)
makedepends=(gcc)
optdepends=(r-biostrings r-drosophila2probe r-runit)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
md5sums=('7053fb56a45728eafe5126073ddcbfe1')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
