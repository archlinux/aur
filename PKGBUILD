# Maintainer: masutu dot arch at gmail dot com
pkgname='rubichess-git'
_pkgname=RubiChess
pkgver=2.2.r15.g49e8417
pkgrel=1
pkgdesc="Just another UCI compliant chess engine."
arch=('i686' 'x86_64')
url="https://github.com/Matthies/RubiChess"
license=('GPL3')
makedepends=('git')
provides=('rubichess')
conflicts=('rubichess')
source=("${_pkgname}::git+https://github.com/Matthies/RubiChess.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}/src"
    make profile-build
}

package() {
    cd "${srcdir}/${_pkgname}/src"
    install -Dm755 RubiChess $pkgdir/usr/bin/RubiChess
}
