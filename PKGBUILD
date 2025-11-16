# Maintainer: augustus-7613 <augustus7613.mail@pm.me>
pkgname=kdump
pkgver=1.4.1
pkgrel=1
pkgdesc="Tool to dump info from Kerberos Tickets"
arch=('x86_64')
url="https://github.com/augustus-7613/kdump"
license=('GPL3')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('57a33e2b4d5d3730783f3520d4effbcef977caa2ca116af15dfe4d54fc7f5e15')
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
