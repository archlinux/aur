# Maintainer: Daniel Nilsson <git@dlnilsson.se>

pkgname=dygmate-bin
_pkgname=dygmate
pkgver=1.0.0
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
sha256sums=('5fa8d693dde422aa19cbf156cb70a13dc8a794b40912f2443525517a4919ce4f')

package() {
    install -Dm755 "${srcdir}/dygmate" "${pkgdir}/usr/bin/dygmate"
    install -Dm755 "${srcdir}/dygmate-tray" "${pkgdir}/usr/bin/dygmate-tray"
    install -Dm644 "${srcdir}/dygmate-tray.service" "${pkgdir}/usr/lib/systemd/user/dygmate-tray.service"
    install -Dm644 "${srcdir}/99-dygmate.rules" "${pkgdir}/usr/lib/udev/rules.d/99-dygmate.rules"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
