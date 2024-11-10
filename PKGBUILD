# Contributor: Alexey Kutepov <reximkut@gmail.com>
# Maintainer: Nicholas Heyer <nick@heyer.app>
pkgname=tore
pkgver=1.0.0
pkgrel=1
pkgdesc="A notification/reminder command-line utility"
arch=('x86_64')
url="https://github.com/nickheyer/tore"
license=('MIT')
source=("https://github.com/nickheyer/tore/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
install=tore.install

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    gcc -o nob nob.c
    ./nob
}

package() {
    install -Dm755 "$srcdir/${pkgname}-${pkgver}/build/tore" "$pkgdir/usr/bin/tore"
}