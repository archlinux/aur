# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=markdown
_cranver=0.9
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-markdown
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Markdown Rendering for R"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' 'r-mime>=0.3')

optdepends=('r-knitr' 'r-rcurl')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('eecc5cce41ffaa3bb0fbede85d59d769')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

