# Maintainer: augustus-7613 <augustus7613.mail@pm.me>
pkgname=kdump
pkgver=1.4.0
pkgrel=1
pkgdesc="Tool to dump info from Kerberos Tickets"
arch=('x86_64')
url="https://github.com/augustus-7613/kdump"
license=('GPL3')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d37c47bf981d73e728432d268a99da95a3bcacab0e7dca05642b58e5fae8d1cd')
options=('!debug')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir build && cd build
    cmake ..
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}/build"
    install -Dm755 kdump "$pkgdir/usr/bin/kdump"
}
