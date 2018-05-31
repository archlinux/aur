# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=labeling
_cranver=0.3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-labeling
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Axis Labeling"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT' 'Unlimited')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('ccd7082ec0b211aba8a89d85176bb534')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

