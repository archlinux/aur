# Contributor: Kibouo <csonka.mihaly@hotmail.com>
_cranname=mvtnorm
_cranver=1.0-10
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-mvtnorm
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Computes multivariate normal and t probabilities, quantiles, random deviates and densities."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL-2')
depends=('r>=3.5.0')
makedepends=('gcc-fortran>=8.3.0')
provides=("${pkgname}")
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('a76285dab2ea61aef7cc8a96340e0fd6')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
