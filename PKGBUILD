# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=coder
_pkgname=agentapi
pkgname=${_pkgname}-bin
pkgver=0.12.1
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
            'f1fd64a62a807a5b1fb09fc96bdf904740bd9d21b5ce7e0fdd47d58143f3a8ca')
sha256sums_x86_64=('c65243f84bd70906f336e2ea3f3e4aa160b74fff09efcdeed5f255f659bc63bf')
sha256sums_aarch64=('0b94e855e330f3d9b7aa6472cd2c1f8daedaf369bb72ec1de7e6bbe91c2c0b56')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
