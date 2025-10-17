# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=coder
_pkgname=agentapi
pkgname=${_pkgname}-bin
pkgver=0.10.1
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
            '98602aa7082b1effa07382832fa6a86be759e9b1cd85c5f058996718185acc93')
sha256sums_x86_64=('bb67d803bc69f857c46371568e25420d63cb8e6ae32eca23669590f068ad2fa8')
sha256sums_aarch64=('8f946dfae28b14d095f58af0c44d1d02e90fc198dfef6446e5000b4e6c77f418')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
