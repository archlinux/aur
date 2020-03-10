# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Clint Valentine <valentine.clint@gmail.com>

_cranname=corpus
_cranver=0.10.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Text Corpus Analysis"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(Apache2.0)
depends=('r>=3.3' 'r-utf8>=1.1.0')
makedepends=(gcc)
optdepends=(r-knitr r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('e04afcf4e56ed90fdde829399913e1c5')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
