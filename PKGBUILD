# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=tau
_cranver=0.0-24
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Text Analysis Utilities"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=2.10')
optdepends=('r-tm')
source=(https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz)
sha256sums=(f08d9fc92ed11ec01f7da12ccf98862e36ef8bb69d5e42584a08b46cea6917e1)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
