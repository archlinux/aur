# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=RColorBrewer
_cranver=1.1-2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rcolorbrewer
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="ColorBrewer Palettes"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('Apache')
depends=('r')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
sha512sums=('29eeecae274c57f2af3366d072fb6a61a1e0be64aae9393e10c7e92c3b98473b60b7042b532c49e0ce2f53e6dce1a728ddd6937bbc64cedcb3664a429c3e54da')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}

package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

