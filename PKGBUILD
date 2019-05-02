# Contributor: Kibouo <csonka.mihaly@hotmail.com>
_cranname=askpass
_cranver=1.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-askpass
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc='Cross-platform utilities for prompting the user for credentials or a passphrase.'
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('a00d6599ff99f501534c1d965a1fd3b4')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir        
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

