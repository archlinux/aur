# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=XVector
_bcver=0.32.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Foundation of external vector representation and manipulation in Bioconductor"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=4.0.0' 'r-biocgenerics>=0.37.0' 'r-s4vectors>=0.27.12' 'r-iranges>=2.23.9' r-zlibbioc)
optdepends=(r-biostrings r-drosophila2probe r-runit)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('192b8175d836bf574254cf163580cc7f18fc6c3eb49f7136a057ab98da2383b3')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
