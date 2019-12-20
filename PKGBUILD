# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=mime
_cranver=0.8
pkgname=r-mime
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Guesses the MIME type from a filename extension using the data derived from /etc/mime.types in UNIX-type systems."
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL-2' 'GPL-3')
depends=('r')
makedepends=('gcc')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('2ce9165bb1ed4954798f2ff952058ae8')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
