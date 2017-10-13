# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=alarm
pkgver=1.2
pkgrel=1
pkgdesc="Schedule an alarm for a program when starting it"
url="https://github.com/maandree/alarm"
arch=(i686 x86_64)
license=(custom:ISC)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(c5f4f3f7ae975f4f64093eed85cc838cd43ab7af1773f250597de36ba0c3c68d)

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
