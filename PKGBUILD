# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=corpus
_cranver=0.10.0
pkgname="r-${_cranname}"
pkgver="${_cranver}"
pkgrel=3
pkgdesc="Corpus data analysis R tools with unicode support"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('Apache-2.0')
depends=('r>=3.0.1' 'r-utf8')
conflicts=('r-corpus')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('7458f654757d096d1739147e43ba02358cfe5c9b14042d6ac622aa6575262831')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
