# Maintainer: augustus-7613 <augustus7613.mail@pm.me>
pkgname=kdump
pkgver=1.4.3
pkgrel=1
pkgdesc="Tool to dump info from Kerberos Tickets"
arch=('x86_64')
url="https://github.com/augustus-7613/kdump"
license=('GPL3')
depends=('krb5')
makedepends=('cmake' 'glibc' 'gcc' 'make')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ed035134432fa409d3c6620f4bd76e5097bff0a25340dd53c5962051c8856b0d')
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
