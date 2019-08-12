# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=markdown
_cranver=1.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-markdown
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Markdown Rendering for R"
arch=('x86_64' 'i686')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' 'r-mime>=0.3' 'r-xfun')

optdepends=('r-knitr' 'r-rcurl')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('51fedf7d7f62da1f828a80bd71ccba1d')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

