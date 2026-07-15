# Maintainer: Daniel Nilsson <git@dlnilsson.se>

pkgname=dygmate-bin
_pkgname=dygmate
pkgver=0.1.3
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
sha256sums=('5f534b5e70500f17ee2910490038797cf099c7213ab509e29f5d12d4b585cb38')

package() {
    install -Dm755 "${srcdir}/dygmate" "${pkgdir}/usr/bin/dygmate"
    install -Dm755 "${srcdir}/dygmate-tray" "${pkgdir}/usr/bin/dygmate-tray"
    install -Dm644 "${srcdir}/dygmate-tray.service" "${pkgdir}/usr/lib/systemd/user/dygmate-tray.service"
    install -Dm644 "${srcdir}/99-dygmate.rules" "${pkgdir}/usr/lib/udev/rules.d/99-dygmate.rules"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
