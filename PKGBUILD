# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=mnormt
_cranver=1.5-6
pkgname=r-$_cranname
pkgver=1.5_6
pkgrel=1
pkgdesc="The multivariate Normal and T distributions."
url="https://cran.r-project.org/package=${_cranname}"
arch=('i686' 'x86_64')
license=('GPL-2' 'GPL-3')
depends=('r>=2.2.0')
makedepends=('gcc-fortran')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('baf4a66a61ab3193c81a130e202cba8d')

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdr}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
