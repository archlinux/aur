# Maintainer: portaloffreedom

_cranname=repr
_cranver=0.15.0
pkgname=r-${_cranname}
pkgver=${_cranver}
pkgrel=1
pkgdesc="String and binary representations of objects for several formats / mime types"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('r>=3.0.0' 'r-htmltools' 'r-base64enc')
provides=("r-cran-${_cranname}")
conflicts=("r-cran-${_cranname}")
replaces=("r-cran-${_cranname}")
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('00a2b8ab86bbf04b7f79e64d38ce26fe03e5069699557be27ae0de165343cf57')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
