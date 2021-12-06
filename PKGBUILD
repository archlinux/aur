# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=listenv
_cranver=0.8.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Environments Behaving (Almost) as Lists"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL2.1 LPGL3)
depends=('r>=3.1.2')
optdepends=(r-r.utils r-r.rsp r-markdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('fd2aaf3ff2d8d546ce33d1cb38e68401613975117c1f9eb98a7b41facf5c485f')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
