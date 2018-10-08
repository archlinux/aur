# Maintainer: Ilja Kocken <i.j.kocken@uu.nl>

_cranname=fansi
_cranver=0.4.0
pkgname="r-${_cranname}"
pkgver="${_cranver}"
pkgrel=1
pkgdesc="Counterparts to R string manipulation functions that account for the effects of ANSI text formatting control sequences."
url="https://cran.r-project.org/package=fansi"
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('r-fansi')
provides=('r-fansi')
depends=('r')
optdepends=('r-unitizer' 'r-knitr' 'r-rmarkdown' 'r-pillar' 'r-cli')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('e104e9d01c7ff8a847f6b332ef544c0ef912859f9c6a514fe2e6f3b34fcfc209')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
