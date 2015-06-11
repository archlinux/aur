# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=bully
pkgver=1.0.22
pkgrel=2
pkgdesc="Retrieve WPA/WPA2 passphrase from a WPS enabled access point."
arch=('i686' 'x86_64')
url="https://github.com/bdpurcell/bully"
license=('GPL3')
depends=('libpcap' 'openssl')
makedepends=('make')
source=('https://github.com/blshkv/bully/archive/v1.0-22.tar.gz')
sha512sums=('7b25225afd55da87df33436d2192673731d9c6300bc146f8f55dcfddf03a2308db33161c3ca1c99b30b2275d9822ff44122298669fff0efd3752a2a0e6991dc3')

build() {
    cd "${srcdir}/${pkgname}-$(echo ${pkgver} | sed 's/\./-/2g')/src"

    make
}

package() {
    cd "${srcdir}/${pkgname}-$(echo ${pkgver} | sed 's/\./-/2g')/src"

    install -Dm755 "bully" "${pkgdir}/usr/bin/bully"
}
