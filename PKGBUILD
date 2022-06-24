# Maintainer: dhn <neilson+aur@sent.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=gtools
pkgname=r-$_pkgname
pkgver=3.9.2.2
pkgrel=1
pkgdesc='Various R Programming Tools'
arch=('any')
url="https://cran.r-project.org/web/packages/$_pkgname/"
license=('GPL2')
depends=()
makedepends=()
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_pkgname}_$pkgver.tar.gz")
sha512sums=('db9266e9bec896a05435dfe6cb6c7eddb0768792d58682405d3fffb619a679fcb7b9d3d422ebc585f685cfb9ffb2249f0fccbb7324353b4dcd783437d5390907')

build(){
    R CMD INSTALL ${_pkgname}_$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership ${_pkgname} "$pkgdir"/usr/lib/R/library
}
