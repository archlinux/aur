# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=RCurl
_cranver=1.98-1.5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="General Network (HTTP/FTP/...) Client Interface for R"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(BSD3)
depends=('r>=3.4.0' r-bitops curl)
makedepends=(make)
optdepends=(r-xml)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('73187c9a039188ffdc255fb7fa53811a6abfb31e6375a51eae8c763b37dd698d')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
