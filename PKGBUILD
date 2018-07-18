# Maintainer: Toni Uhlig <matzeton@googlemail.com>
pkgname=potd
pkgver=13d2559fcf6240754cbf4c5cc30079a1d4a4bdf7
pkgrel=1
pkgdesc="A hgih scalable SSH/TCP honeypot."
arch=('i686' 'x86_64')
url="https://github.com/lnslbrty/potd"
license=('BSD-3')
depends=('libssh' 'libseccomp')
source=("https://github.com/lnslbrty/potd/archive/${pkgver}.zip")
md5sums=('214bdf40201fd23cc981d081eefc0263')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}
