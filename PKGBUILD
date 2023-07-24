# Maintainer: Riderius <riderius.help@gmail.com>

pkgname=today-journal
pkgver=5.3.1
pkgrel=1
pkgdesc="POSIX shell script for keeping a daily journal."
arch=('any')
url="https://sr.ht/~sotirisp/today/"
license=('GPL3' 'custom:CC0-1.0')
depends=('grep')
makedepends=('make' 'scdoc')
provides=('today')
source=("${pkgname}-v${pkgver}.tar.gz::https://git.sr.ht/~sotirisp/today/archive/v${pkgver}.tar.gz")
sha256sums=('61429dcbf3f79b0e1342d48fe7841f2df751a4f2ef186876b21ed7943fb4b903')

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
