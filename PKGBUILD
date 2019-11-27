# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=generics
_cranver=0.0.2
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Common S3 Generics not Provided by Base R Methods Related to Model Fitting"
url="https://cran.r-project.org/package=${_cranname}"
arch=('any')
license=('GPL-2')
depends=('r>=3.1')
optdepends=('r-covr' 'r-pkgload' 'r-testthat' 'r-tibble')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
#source=("http://cran.r-project.org/src/contrib/Archive/${_cranname}/${_cranname}_${_cranver}.tar.gz" # uncomment if 404 error
md5sums=('9b4d9351c6c413e6f67ec7a041217946')

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
