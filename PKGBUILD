# Maintainer: augustus-7613 <augustus7613.mail@pm.me>
pkgname=kdump
pkgver=1.3.0
pkgrel=1
pkgdesc="Tool to dump info from Kerberos Tickets"
arch=('x86_64')
url="https://github.com/augustus-7613/kdump"
license=('GPL3')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3005c80561b8d75893736d1cefd674cd3857e1ab34849b2f64d3238df1934118')
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
