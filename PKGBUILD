# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=chron
_cranver=2.3-56
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Chronological Objects which can Handle Dates and Times"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=2.12.0')
optdepends=(r-scales r-ggplot2)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('863ecbb951a3da994761ea9062fa96d34e94e19fbc4122521ac179274dfa3f5d')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
