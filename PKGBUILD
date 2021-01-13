# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=data.table
_cranver=1.13.6
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Extension of 'data.frame'"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MPL2)
depends=('r>=3.1.0' zlib)
optdepends=(r-bit64 r-bit r-curl r-r.utils r-xts r-nanotime r-zoo r-yaml r-knitr r-rmarkdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('d50cdd4c4f89cabf83baa9114e49a3b8179f403c499d6e0be7791a44ffcd3e9b')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
