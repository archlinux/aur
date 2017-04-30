# Maintainer: Ľubomír 'The_K' Kučera <lubomir-dot-kucera-dot-jr-at-gmail-dot-com>

pkgname=bully
pkgver=1.1
pkgrel=1
pkgdesc="Retrieve WPA/WPA2 passphrase from a WPS enabled access point."
arch=('i686' 'x86_64')
url="https://github.com/aanarchyy/bully"
license=('GPL3')
depends=('libpcap' 'openssl-1.0')
optdepends=('pixiewps')
makedepends=('make')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('aa379d7e73cdf2dc722d05aa8301754207e5a29bb11bab588c393194df17de48')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/src"

    CFLAGS=-I/usr/include/openssl-1.0 LDFLAGS="-l:libssl.so.1.0.0 -l:libcrypto.so.1.0.0" make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/src"

    make install DESTDIR="${pkgdir}" prefix=/usr
}
