# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=XVector
_bcver=0.40.0
pkgname=r-${_bcname,,}
pkgdesc="Foundation of external vector representation and manipulation in Bioconductor"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic2.0)
pkgver=${_bcver//[:-]/.}
pkgrel=1

arch=(i686 x86_64)
depends=(
    "r>=4.0.0"
    "r-biocgenerics>=0.37.0"
    "r-s4vectors>=0.27.12"
    "r-iranges>=2.23.9"
    "r-zlibbioc"
)
optdepends=(
    "r-biostrings"
    "r-drosophila2probe"
    "r-runit"
)

source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("902b3fcc354e8fce318968917f2df1b576db34b6be3dc82a70c0e1b889e86cf49b10770067c197a17bf8b26a13dbfb49f04885017c81d112afef1fe13819251e")

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
