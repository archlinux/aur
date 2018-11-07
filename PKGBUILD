# Maintainer: Kuan-Yen Chou <forendef2846 at gmail dot com>

pkgname=bgpdump
pkgver=1.6.0
pkgrel=1
pkgdesc='A C library designed to help with analyzing dump files produced by Zebra/Quagga or MRT'
depends=('zlib' 'bzip2')
makedepends=('autoconf')
arch=('x86_64')
url="https://bitbucket.org/ripencc/bgpdump"
license=('GPL')
provides=('bgpdump')
source=("https://bitbucket.org/ripencc/bgpdump/get/${pkgver}.tar.gz")
sha512sums=('04883a01fbc2829a4298b3f280d1a6c023f57fbabca082ea8578130235a088c0f326888c523b1e59485cc889b9c18888beb1a5bc3ecd0fe1054200c390251153')

build() {
    cd "${srcdir}"/ripencc-bgpdump-*
    autoheader
    autoconf
    ./configure \
        --prefix="${pkgdir}/usr" \
        --sbindir="${pkgdir}/usr/bin"
    make
}

package() {
    cd "$srcdir"/ripencc-bgpdump-*
    make install
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et :
