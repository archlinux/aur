# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
_cranname=mime
_cranver=0.6
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
md5sums=('a033d88ac9bc733868d145fdc44f8c96')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
