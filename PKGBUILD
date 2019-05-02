# Contributor: Kibouo <csonka.mihaly@hotmail.com>
_cranname=unix
_cranver=1.5
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-unix
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc=' to system utilities found in most Unix systems.'
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('c2964321773cb7f98c0fb37cc6d169a6')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
        
