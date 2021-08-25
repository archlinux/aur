# Maintainer: Valeriy Huz <ghotrix@gmail.com>
pkgname='xiphos-chess-git'
_pkgname=xiphos-chess
pkgver=v0.6.r5.g16e73a5
pkgrel=1
pkgdesc="Fairly strong UCI engine."
arch=('i686' 'x86_64')
url="https://github.com/milostatarevic/xiphos"
license=('GPL3')
makedepends=('git')
optdepends=('xboard' 'scid_vs_pc')
provides=('xiphos-chess')
conflicts=('xiphos-chess')
source=("${_pkgname}::git+https://github.com/milostatarevic/xiphos")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
	make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 xiphos-sse $pkgdir/usr/bin/xiphos
}
