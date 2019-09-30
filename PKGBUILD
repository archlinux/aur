# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=maps
_cranver=3.3.0
pkgname=r-${_cranname}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Draw Geographical Maps"
arch=('i686' 'x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r')
optdepends=('r-mapproj>=1.2.0' 'r-mapdata>=2.3.0' 'r-sp' 'r-maptools' 'r-rnaturalearth')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('3656020f104dab8d39642b87dba09330')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
