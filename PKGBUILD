# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=involvex
_pkgname=youtube-music-cli
pkgname=${_pkgname}-bin
pkgdesc="A powerful Terminal User Interface (TUI) music player for YouTube Music"

pkgver=0.0.58
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'mpv' 'yt-dlp')

source=("FEATURE_STATUS-${pkgver}.md::${_urlraw}/FEATURE_STATUS.md"
		"SUGGESTIONS-${pkgver}.md::${_urlraw}/SUGGESTIONS.md"
		"README-${pkgver}.md::${_urlraw}/readme.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}")
sha256sums=('a250e755ce6352f5dd688ba960feddfd432215043ce7e3ce8bfa6f9f82c380af'
            '73f0787fbfdc8981adace5d6309dfa25a07744492f3688892eb9d4b7ee6aaef4'
            '82e0410f9eb702e675f37ec51edb59e0bd7892bd29a7da6eb1bbc6e480888155'
            '8e0fa698e1e37adc44d567345a8db5e099f99c78e13123d631416a3813c6832e')
sha256sums_x86_64=('4bfa27fd01ffa00431f4bc04b869a6e0f0bcc3b0a01506b4a736ba380fe31fec')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "FEATURE_STATUS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/FEATURE_STATUS.md"
	install -Dm644 "SUGGESTIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SUGGESTIONS.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
