# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=alarm
pkgver=1.2.3
pkgrel=1
pkgdesc="Schedule an alarm for a program when starting it"
url="https://codeberg.org/maandree/alarm"
arch=(i686 x86_64)
license=(custom:ISC)
source=("alarm-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(11dd4d8032794a61f32ac10ae772ece9b1f185ea323169140220c0e33a3e4907)

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
