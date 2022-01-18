# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rversions
_cranver=2.1.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Query 'R' Versions, Including 'r-release' and 'r-oldrel'"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(r r-curl 'r-xml2>=1.0.0')
optdepends=(r-mockery r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('79aaacf5a1258d91ac0ddedf3c8c16a2d10d39010993dcc7b0a2638afee27cb1')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
