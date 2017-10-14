# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=alarm
pkgver=1.2
pkgrel=1
pkgdesc="Schedule an alarm for a program when starting it"
url="https://github.com/maandree/alarm"
arch=(i686 x86_64)
license=(custom:ISC)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(c39eec06fd7678acfedaffbedcdf00e95744dab48c97e0ca1055a9ea2164537a)

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
