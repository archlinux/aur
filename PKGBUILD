# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=sysfonts
_cranver=0.8.8
_archivedate=2022-03-14
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Loading Fonts into R"
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=(r)
optdepends=(r-curl r-jsonlite)
source=("https://cran.microsoft.com/snapshot/${_archivedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(f6b2a8d6af4803f895c29b45fe833983bd4ddc542c7d67ffca4f2740896d05bb)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
