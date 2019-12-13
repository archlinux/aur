# Originator: wagnerflo <florian@wagner-flo.net>
# Maintainer: Matt Frichtl <frichtlm@gmail.com>
_cranname=plyr
_cranver=1.8.5
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Tools for Splitting, Applying and Combining Data"
url="http://cran.r-project.org/package=${_cranname}"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1.0' 'r-rcpp>=0.11.0')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('f06cb24b1d0e87e914b94a2de0fccc60')

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
