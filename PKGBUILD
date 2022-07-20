# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=alarm
pkgver=1.2.1
pkgrel=1
pkgdesc="Schedule an alarm for a program when starting it"
url="https://codeberg.org/maandree/alarm"
arch=(i686 x86_64)
license=(custom:ISC)
source=("alarm-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(6a52f07f7b269b6d082609a18abbe7735e262008142530d7ba7ddc647fd78935)

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
