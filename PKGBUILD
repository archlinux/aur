# Maintainer: masutu dot arch at gmail dot com
pkgname='defenchess-git'
_pkgname=Defenchess
pkgver=2.2.r3.ge5aa4be
pkgrel=1
pkgdesc="A free, open source UCI chess engine written in C++. "
arch=('i686' 'x86_64')
url="https://github.com/cetincan0/Defenchess"
license=('GPL3')
makedepends=('git')
provides=('defenchess')
conflicts=('defenchess')
source=("${_pkgname}::git+https://github.com/cetincan0/Defenchess")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}/src"
    make
}

package() {
    cd "${srcdir}/${_pkgname}/src"
    install -Dm755 Defenchess $pkgdir/usr/bin/Defenchess
}
