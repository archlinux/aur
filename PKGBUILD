# Maintainer: Valeriy Huz <ghotrix@gmail.com>
pkgname='minnow-git'
_pkgname=minnow
pkgver=81
pkgrel=1
pkgdesc="simple and fairly weak chess engine written in C"
arch=('i686' 'x86_64')
url="https://github.com/tm512/minnow"
license=('GPL3')
makedepends=('git')
optdepends=('xboard' 'scid_vs_pc')
provides=('minnow')
conflicts=('minnow')
source=("${_pkgname}::git+https://github.com/tm512/minnow")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

build() {
    cd "${srcdir}/${_pkgname}"
    make -j3 strip
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 minnow $pkgdir/usr/bin/minnow
}
