# Maintainer: Valeriy Huz <ghotrix@gmail.com>
pkgname='xiphos-chess-git'
_pkgname=xiphos-chess
pkgver=1
pkgrel=1
pkgdesc="Fairly strong UCI engine."
arch=('i686' 'x86_64')
url="https://github.com/milostatarevic/xiphos"
license=('GPL3')
makedepends=('git')
optdepends=('xboard' 'scid_vs_pc')
provides=('xiphos')
conflicts=('xiphos')
source=("${_pkgname}::git+https://github.com/milostatarevic/xiphos")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

build() {
    cd "${srcdir}/${_pkgname}"
	make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 xiphos-sse $pkgdir/usr/bin/xiphos
}
