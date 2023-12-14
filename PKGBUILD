# Maintainer: Riderius <riderius.help@gmail.com>

pkgname=today-journal
pkgver=6.1.4
pkgrel=1
pkgdesc="POSIX shell script for keeping a daily journal."
arch=('any')
url="https://sr.ht/~sotirisp/today/"
license=('GPL3' 'custom:CC0-1.0')
depends=('grep')
makedepends=('make' 'scdoc')
provides=('today')
source=("${pkgname}-v${pkgver}.tar.gz::https://git.sr.ht/~sotirisp/today/archive/v${pkgver}.tar.gz")
sha256sums=('02cb54c9f4dc8fa06b0cf5673ff6ebe41dd1566ad70e3ad544d5dfec0d966958')

build() {
    cd today-v${pkgver}
    make doc/today.1
}

package() {
    install -Dm644 "${srcdir}/today-v${pkgver}/LICENSES/GPL-3.0-or-later.txt" "${pkgdir}/usr/share/licenses/${pkgname}/GPL-3.0-or-later.txt"
    install -Dm644 "${srcdir}/today-v${pkgver}/LICENSES/CC0-1.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/CC0-1.0.txt"
    install -Dm755 "${srcdir}/today-v${pkgver}/today" "${pkgdir}/usr/bin/today"
    install -Dm644 "${srcdir}/today-v${pkgver}/doc/today.1" "${pkgdir}/usr/share/man/man1/today.1"
}
