# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=coder
_pkgname=agentapi
pkgname=${_pkgname}-bin
pkgver=0.7.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="HTTP API for Claude Code, Goose, Aider, Gemini, Amp, and Codex"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('6a11e5fb1fdbffeb88c33f160214a034a7198fed8aedc28ba709a299413d64bf'
            '8408ddcd7639c410f8b92e5afe1a83453b393080de305ae5b356708f720b5e76')
sha256sums_x86_64=('163d5983d5dbad2423d7c0eb0d0dd8947f5fdf1eeb1cc1de28a95b64f83ce849')
sha256sums_aarch64=('a1373675290670b78d2a26dfc62d3b821dddcfca220f7e78585d14f88dd962aa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
