# Maintainer: Pranav Laxman <plaxman81@gmail.com>

pkgname='local-chaos'
pkgver=0.2.0
pkgrel=1
pkgdesc='A script for creating and managing a local subset of Chaotic-AUR'
url='https://codeberg.org/plax/local-chaos'
license=('GPL-3.0-or-later')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b21382b48b5d17a63e19fc7fdb750e6eee91c9918cac2a5a245f7820ac1f05d7')
arch=('any')
depends=(bash coreutils pacman pacutils)

package() {
    cd "${pkgname}"
    install -Dm 755 "local-chaos" "${pkgdir}/usr/bin/local-chaos"
    install -Dm 644 "systemd/local-chaos.service" "${pkgdir}/usr/lib/systemd/system/local-chaos.service"
    install -Dm 644 "systemd/local-chaos.timer" "${pkgdir}/usr/lib/systemd/system/local-chaos.timer"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
