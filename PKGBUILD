# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=mime
_cranver=0.7
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-mime
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Guesses the MIME type from a filename extension using the data derived from /etc/mime.types in UNIX-type systems."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL-2' 'GPL-3')
depends=('r>=3.5.0')
makedepends=('gcc-fortran>=8.3.0')
provides=("${pkgname}")
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('4c083166e3371db5289b7b0d6b9e6bbc')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
