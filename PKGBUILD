# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=future
_cranver=1.22.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Unified Parallel and Distributed Processing in R for Everyone"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL2.1 LGPL3)
depends=(r r-digest 'r-globals>=0.14.0' 'r-listenv>=0.8.0' 'r-parallely>=1.26.1')
optdepends=(r-rhpcblasctl r-r.rsp r-markdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('87b24a85caf08e1d809eab28f9258444105cd7788eee2e3e2f21727ba3bbedcd')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
