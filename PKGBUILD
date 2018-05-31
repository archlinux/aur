# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=markdown
_cranver=0.8
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-markdown
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Markdown Rendering for R"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' 'r-mime')

optdepends=('r-knitr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('5dde829a865ad65bab37a2b9d243b071')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

