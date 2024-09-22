# Maintainer: Riderius <riderius.help@gmail.com>

pkgname=today-journal
pkgver=6.2.1
pkgrel=1
pkgdesc="POSIX shell script for keeping a daily journal"
arch=('any')
url="https://sr.ht/~sotirisp/today/"
license=('GPL-3.0-or-later AND CC0-1.0')
depends=('sh' 'grep')
makedepends=('make' 'scdoc')
provides=('today')
source=("${pkgname}-v${pkgver}.tar.gz::https://git.sr.ht/~sotirisp/today/archive/v${pkgver}.tar.gz")
sha256sums=('168d814c636cb6e3521162d5ebaaa8dd51ff538e08d0ba345417d9194f727942')

build() {
    cd today-v${pkgver}
    make doc/today.1
}

package() {
    install -Dm755 "${srcdir}/today-v${pkgver}/today" "${pkgdir}/usr/bin/today"
    install -Dm644 "${srcdir}/today-v${pkgver}/doc/today.1" "${pkgdir}/usr/share/man/man1/today.1"
    install -Dm755 "${srcdir}/today-v${pkgver}/contrib/today-scripts/today-template" "${pkgdir}/usr/share/today-journal/today-scripts/today-template"
}
