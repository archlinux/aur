# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=clipr
_cranver=0.4.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-clipr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Read and Write from the System Clipboard"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' )

optdepends=('xclip' 'xsel' 'r-rstudioapi' 'r-testthat' 'r-covr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('af6df212dd9551808cdb92444e3e8a36')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

