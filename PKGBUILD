# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
_cranname=uuid
_cranver=0.1-4
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-uuid
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for generating and handling of UUIDs (Universally Unique Identifiers)."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=2.9.0')


sha256sums=('98e0249dda17434bfa209c2058e9911e576963d4599be9f7ea946e664f8ca93e')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")

build(){
cd "${srcdir}"
R CMD INSTALL ${_pkgtar} -l ${srcdir}
}
package() {
cd "${scrdir}"
install -dm0755 "$pkgdir/usr/lib/R/library"
cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
