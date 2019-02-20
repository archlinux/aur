# Maintainer: Valeriy Huz <ghotrix@gmail.com>
pkgname='ethereal-git'
_pkgname=ethereal
pkgver=1128
pkgrel=1
pkgdesc="UCI-compliant chess engine. It uses the traditional alpha-beta framework in addition to a variety of pruning, reduction, extension, and other improvements."
arch=('i686' 'x86_64')
url="https://github.com/AndyGrant/Ethereal"
license=('GPL3')
makedepends=('git')
optdepends=('xboard' 'scid_vs_pc')
provides=('ethereal')
conflicts=('ethereal')
source=("${_pkgname}::git+https://github.com/AndyGrant/Ethereal")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

build() {
    cd "${srcdir}/${_pkgname}/src"
    make -j3
}

package() {
    cd "${srcdir}/${_pkgname}/src"
    install -Dm755 Ethereal $pkgdir/usr/bin/Ethereal
}
