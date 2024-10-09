# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=alarm
pkgver=1.2.2
pkgrel=1
pkgdesc="Schedule an alarm for a program when starting it"
url="https://codeberg.org/maandree/alarm"
arch=(i686 x86_64)
license=(custom:ISC)
source=("alarm-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(005e3a1e4e453622c60a8a6287a981adafcfc13b3c95da95c2f2baa438ad5e53)

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
