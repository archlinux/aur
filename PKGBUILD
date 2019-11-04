# Maintainer: Matt Frichtl <frichtlm@gmail.com>
# Contributor: Grey Christoforo <first name at last name dot net>
_cranname=backports
_cranver=1.1.5
pkgname=r-${_cranname}
pkgver=${_cranver}
pkgrel=1
pkgdesc="Reimplementations of Functions Introduced Since R-3.0.0"
arch=('x86_64')
url="https://cran.r-project.org/package=backports"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
#source=("http://cran.r-project.org/src/contrib/Archive/${_cranname}_${cranver}.tar.gz") # uncomment line if 404 error
md5sums=('3e22dd9c53fa5822c14b2d476f86a0ea')

build() {
    cd "$srcdir"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "$srcdir"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
