# Maintainer: Edward Pacman <micro <dot> fedora AT gmail DOT com>
pkgname=dnsproxy
pkgver=git+f03234a
pkgrel=1
pkgdesc="A simple DNS proxy server, runing on multiple platform"
arch=('any')
url="https://github.com/vietor/dnsproxy"
license=('GPL')
makedepends=('git'
            'make')
source=("git+https://github.com/vietor/dnsproxy.git")
md5sums=("SKIP")

prepare() {
    cd "$pkgname"
    git submodule init
    git submodule update
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    cp src/dnsproxy $pkgdir/usr/bin
}

