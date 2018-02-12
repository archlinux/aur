# Maintainer: Kuan-Yen Chou <forendef2846 at gmail dot com>

pkgname=bgpdump
pkgver=1.5.0
pkgrel=1
pkgdesc='A C library designed to help with analyzing dump files produced by Zebra/Quagga or MRT'
depends=('zlib' 'bzip2')
makedepends=('autoconf')
arch=('x86_64')
url="https://bitbucket.org/ripencc/bgpdump"
license=('GPL')
provides=('bgpdump')
source=("https://bitbucket.org/ripencc/bgpdump/get/${pkgver}.tar.gz")
sha512sums=('70cb68eb70fc0a2d10597421c79bca5506f8d089ceffbe7a1c4555ffd871fd0bd5ba1b441c8af94e3a257db56afb5ea20546dcaa4349046187daadd1681febb4')

build() {
    cd "$srcdir"/ripencc-bgpdump-*
    autoheader
    autoconf
    ./configure \
        --prefix="$pkgdir"/usr \
        --sbindir="$pkgdir"/usr/bin
    make
}

package() {
    cd "$srcdir"/ripencc-bgpdump-*
    make install
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et :
