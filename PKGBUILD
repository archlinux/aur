# Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=abind
_cranver=1.4-5
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-abind
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Combine multidimensional arrays into a single array, a generalization of 'cbind' and 'rbind'."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('LGPL2' 'LGPL2.1' 'LGPL3')
depends=('r>=1.5.0' )
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('136f981e1c4f618b64a87faaa7797c97')

build(){
    R CMD INSTALL "${_pkgtar}" -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir"/usr/lib/R/library
}


