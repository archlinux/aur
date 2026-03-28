# Maintainer: Pranav Laxman <plaxman81 at gmail dot com>

pkgname='local-chaos'
pkgver=0.1.0
pkgrel=1
pkgdesc='A script for creating and managing a local subset of Chaotic-AUR'
url='https://codeberg.org/plax/local-chaos'
license=('GPL-3.0-or-later')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d7c1900d43f286be316b62df0e553efcdacfee0873eb7dc79be1b5cfae9cd235')
arch=('any')
depends=(bash coreutils pacman pacutils)

package() {
    cd "${pkgname}"
    install -Dm 755 "local-chaos" "${pkgdir}/usr/bin/local-chaos"
    install -Dm 644 "systemd/local-chaos.service" "${pkgdir}/usr/lib/systemd/system/local-chaos.service"
    install -Dm 644 "systemd/local-chaos.timer" "${pkgdir}/usr/lib/systemd/system/local-chaos.timer"
}
