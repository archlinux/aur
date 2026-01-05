# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=KarlVM12
_pkgname=dimensions
pkgname=${_pkgname}-bin
pkgdesc="Terminal Tab Manager - Organize your terminal workflows with an interactive TUI"

pkgver=0.2.19
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md" "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('3f75941f22fa8fec88cc0fa45a4ffd03bcdadf529c021ea13e9bfd04c088b4df'
            '1ffac657541f5fab7294f85f2b643631e55f6c8334496862a4a3e12146bca861')
sha256sums_x86_64=('0297bc2fefc1b155ecc7f6ce4735e330c1714c04f7ffdad89c94cdb66e349117')
sha256sums_aarch64=('b084ed267012de9cb45ee48d7067a66e7be30e4b20f58bc4cb3e53c90ecbb2c1')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
