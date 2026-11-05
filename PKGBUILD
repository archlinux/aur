# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=Lifailon
_pkgname=lazyjournal
pkgname=${_pkgname}-bin
pkgver=0.8.7
pkgrel=1
pkgdesc='TUI for journalctl, file system logs, as well Docker and Podman containers for quick viewing and filtering with fuzzy find and regex support'

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

license=('MIT')

depends=('systemd')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${_barch[1]}")
sha256sums=('003691f02cd7daac075ce43b0934ee248498ad462a22c38a2e7eb1a0ff48393b'
            '9c80212f0d9eff6f195bc9fb7282eece6aab0c9f7981c64e5d305bee051a18e4')
sha256sums_x86_64=('e6f322d764450386ee24581965e9e3c4aad12b3fe926a9fcdc070619bc8d5b2b')
sha256sums_aarch64=('45ac79b7c74bf5de19682f9dc1a769bdb136185f1cc9031de8c924a7d75ec83f')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
