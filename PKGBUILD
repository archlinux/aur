# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=cli
_cranver=1.0.0
pkgname="r-cran-${_cranname}"
pkgver="${_cranver}"
pkgrel=2
pkgdesc="R tools to design and build attractive CLI interfaces with ASCII and unicode support"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r' 'r-assertthat' 'r-crayon')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('8fa3dbfc954ca61b8510f767ede9e8a365dac2ef95fe87c715a0f37d721b5a1d')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
