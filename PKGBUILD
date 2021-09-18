# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=alarm
pkgver=1.2.1
pkgrel=1
pkgdesc="Schedule an alarm for a program when starting it"
url="https://github.com/maandree/alarm"
arch=(i686 x86_64)
license=(custom:ISC)
source=("alarm-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(21227aa026fbadd083c134c6a08a43970674f4088338ac07cf9315ffd10ad7f9)

build() {
    cd "${srcdir}/alarm-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr
}

check() {
    cd "${srcdir}/alarm-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/alarm-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
