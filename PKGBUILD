# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=sfsmisc
_cranver=1.1-2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-sfsmisc
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Utilities from Seminar fuer Statistik ETH Zurich"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )

optdepends=('r-lokern')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('d41f6154390427d0a1a3fe80d78d3348')
replaces=('r-cran-sfsmisc')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

