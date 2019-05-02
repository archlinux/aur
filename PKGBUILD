# Contributor: Kibouo <csonka.mihaly@hotmail.com>
_cranname=sys
_cranver=3.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-sys
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Drop-in replacements for the base system2() function with fine control and consistent behavior across platforms.'
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-unix' 'r-spelling' 'r-testthat')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('190fca32f95385aef9869793c4f6c5c3')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
        
