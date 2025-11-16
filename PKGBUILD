# Maintainer: augustus-7613 <augustus7613.mail@pm.me>
pkgname=kdump
pkgver=1.4.2
pkgrel=1
pkgdesc="Tool to dump info from Kerberos Tickets"
arch=('x86_64')
url="https://github.com/augustus-7613/kdump"
license=('GPL3')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6a6d27699dcc5df7232a190c8cd4cb44b70e83fb12a7924c4980cf0022b06288')
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
