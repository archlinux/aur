# Maintainer: Ilja Kocken <i.j.kocken@uu.nl>

_cranname=fansi
_cranver=0.2.3
pkgname="r-${_cranname}"
pkgver="${_cranver}"
pkgrel=3
pkgdesc="Counterparts to R string manipulation functions that account for the effects of ANSI text formatting control sequences."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('r-fansi')
provides=('r-fansi')
depends=('r')
optdepends=('unitizer')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('db6dfef8bfe6682d58b654b6a6a1d59cb07225ca41755176b465ab8611fd96c9')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
