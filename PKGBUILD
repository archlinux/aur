# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=data.table
_cranver=1.13.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Extension of 'data.frame'"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MPL2)
depends=('r>=3.1.0' zlib)
optdepends=(r-bit64 r-curl r-r.utils r-xts r-nanotime r-zoo r-yaml r-knitr r-rmarkdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('9d4987a86d06e5f8f098095d2643f48b')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
