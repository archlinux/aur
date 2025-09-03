# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-todo
pkgver=1.0.0
pkgrel=20
pkgdesc='todo provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-todo')
provides=('elephant-todo')
source=("${url}/archive/refs/tags/v${pkgver}-beta-20.tar.gz")
sha256sums=('dc4bf3705843e6800318a7ec74acc99669b5025b9bbcfabf7f1f02e959c0a437')

build() {
    cd elephant-${pkgver}-beta-20/internal/providers/todo
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-20/internal/providers/todo
    install -Dm 755 todo.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
