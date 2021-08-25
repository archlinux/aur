# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=('exatorrent')
pkgver=0.0.1
pkgrel=1
pkgdesc="Self-hostable, easy-to-use, lightweight, and feature-rich torrent client written in Go"
provides=('exatorrent')
arch=('any')
license=('GPL3')
url="https://github.com/varbhat/exatorrent"
source=("git+${url}.git#tag=v${pkgver}")
makedepends=('go' 'git' 'gcc' 'npm' 'sqlite')

sha256sums=('SKIP')

build() {
    cd "${pkgname}"
    make web
    make app
}

package() {
    cd "${pkgname}"
    make web
    make app
    install -Dm 755 -t "${pkgdir}/usr/bin" build/exatorrent
}
