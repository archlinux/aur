# Maintainer: Daniel Nilsson <git@dlnilsson.se>

pkgname=dygmate-bin
_pkgname=dygmate
pkgver=0.1.2
pkgrel=1
pkgdesc='Dygma wireless keyboards battery indicator'
arch=('x86_64')
url='https://github.com/dlnilsson/dygmate'
license=('GPL-2.0-only')
options=('!strip')
provides=("${_pkgname}=${pkgver}")
conflicts=('dygmate' 'dygmate-git')
replaces=('dygmate-git')
install="${pkgname}.install"
source=("${_pkgname}-${pkgver}-${CARCH}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${CARCH}.tar.gz")
# Run `updpkgsums` after each release to refresh this checksum.
sha256sums=('944b91bfc60735274537edf7bde2610b8791c1c7fe109044069ebdb7f1085239')

package() {
    install -Dm755 "${srcdir}/dygmate" "${pkgdir}/usr/bin/dygmate"
    install -Dm755 "${srcdir}/dygmate-tray" "${pkgdir}/usr/bin/dygmate-tray"
    install -Dm644 "${srcdir}/dygmate-tray.service" "${pkgdir}/usr/lib/systemd/user/dygmate-tray.service"
    install -Dm644 "${srcdir}/99-dygmate.rules" "${pkgdir}/usr/lib/udev/rules.d/99-dygmate.rules"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
