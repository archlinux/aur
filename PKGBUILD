# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=wikibooks
_cranver=0.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-wikibooks
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Functions and datasets of the german WikiBook GNU R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('e7e28894723f66fd83bdc551bc431390')
replaces=('r-cran-wikibooks')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

