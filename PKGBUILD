# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=coder
_pkgname=agentapi
pkgname=${_pkgname}-bin
pkgver=0.9.0
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
            '5b18143da074ed65b98b828fadc83877aa0660c8125ff917803916932340a4ba')
sha256sums_x86_64=('13560f59f914814fd5e4542e6bdfb1d4cf90e8ce228c7a8d713f549cb486f189')
sha256sums_aarch64=('56e1069b769ce2f2342342c1f4826e28a5abe8c33670d82205be9cf0827a7979')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
