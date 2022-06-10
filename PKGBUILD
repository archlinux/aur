# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=RCurl
_cranver=1.98-1.7
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
sha256sums=('2ac22d0160633fe3b6b26f3eda5df839eee1120f0111e1172f0fc801f874188d')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
