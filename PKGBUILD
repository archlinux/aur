# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=XVector
_bcver=0.42.0
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
b2sums=("e16210b019f53226cbfc68cda2883cf70765ee84f656b36aca4b17d6ef69b0c4fbcd8577ad10f7cca9c2d172376e48306c3d987e69798b8d8d42f7033a5648b3")

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
