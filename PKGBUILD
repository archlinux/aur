# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=pkgconfig
_cranver=2.0.3
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Set R package configuration options on a per-package basis."
url="https://cran.r-project.org/package=pkgconfig"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r')
optdepends=('r-covr' 'r-testthat' 'r-disposables')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('7b9ca1d45d941238381cb55d13ff4d68') 

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
