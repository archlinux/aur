# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
_cranname=uuid
_cranver=1.0-3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-uuid
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for generating and handling of UUIDs (Universally Unique Identifiers)."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=2.9.0')
optdepends=('r-bigReg')

sha256sums=('456e4633659f20242fd7cd585ad005a3e07265f1d1db383fca6794c8ac2c8346')
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
