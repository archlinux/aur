_cranname=XML
_cranver=3.99-0.8
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="An ODBC database interface"
arch=(any)
depends=("libxml2" "r")
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('8e17fe060cb714a4f4eca7b7659ff5ef')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
