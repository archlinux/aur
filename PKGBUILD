# Maintainer: frichtlm <frichtlm@gmail.com>
# Contributor: Grey Christoforo <first name at last name dot net>
_cranname=digest
_cranver=0.6.22
pkgname=r-${_cranname}
pkgver=${_cranver}
pkgrel=1
pkgdesc="A function for creating hash digests of R objects."
url="https://cran.r-project.org/package=${_cranname}"
arch=('i686' 'x86_64')
license=('GPL-2' 'GPL-3')
depends=('r>=3.1.0')
optdepends=('r-tinytest' 'r-knitr' 'r-markdown')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
#source=("http://cran.r-project.org/src/contrib/Archive/${_cranname}/${_cranname}_${_cranver}.tar.gz") # replace with this if 404 error
md5sums=('1199cb5013c99ed519f74cdf0857f9da') 

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
