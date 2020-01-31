# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=jpeg
_cranver=0.1-8.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Read and write JPEG images"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=2.9.0' libjpeg)
makedepends=(gcc)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('d721caf72c11eea43553d6030ae39cbc')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
