# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=xts
_cranver=0.10-2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-xts
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="eXtensible Time Series"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-zoo' 'r-zoo')

optdepends=('r-timeseries' 'r-timedate' 'r-tseries' 'r-chron' 'r-fts' 'r-tis')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('c83c320e1699d060862214b70df92419')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

