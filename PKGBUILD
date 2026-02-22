# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=alarm
pkgver=1.2.4
pkgrel=1
pkgdesc="Schedule an alarm for a program when starting it"
url="https://codeberg.org/maandree/alarm"
arch=(i686 x86_64)
license=(custom:ISC)
source=("alarm-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(33630fa2a0eb3c3d43962c1defac25af31333c507c8f7d103be75ea79e41ae96)

build() {
    cd "${srcdir}/alarm"
    make DESTDIR="${pkgdir}" PREFIX=/usr
}

check() {
    cd "${srcdir}/alarm"
    make check
}

package() {
    cd "${srcdir}/alarm"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
