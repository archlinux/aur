# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=bgpdump
pkgver=1.6.2
pkgrel=1
pkgdesc='Utility and C Library for parsing MRT files'
arch=('x86_64')
url="https://github.com/RIPE-NCC/bgpdump"
license=('GPL2')
depends=('zlib' 'bzip2')
makedepends=()
source=("https://github.com/RIPE-NCC/bgpdump/archive/v${pkgver}.tar.gz")
sha256sums=('415692c173a84c48b1e927a6423a4f8fd3e6359bc3008c06b7702fe143a76223')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoheader
    autoconf
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et :
