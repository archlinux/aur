# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=involvex
_pkgname=youtube-music-cli
pkgname=${_pkgname}-bin
pkgdesc="A powerful Terminal User Interface (TUI) music player for YouTube Music"

pkgver=0.0.61
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
            '7ca06bafb061dbc8e3df2c820f8da9adafbc66b1f6a77b7b8bd132eb0d90c8d3'
            '334063151c2f20a4898d7d9b9b2dc535927c239f5b124013013908fe5981f5d0'
            '8e0fa698e1e37adc44d567345a8db5e099f99c78e13123d631416a3813c6832e')
sha256sums_x86_64=('7ebca6778b71fafcaad760caaec8733c7f26f1cae8f42b38dccb3b554c946da1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "FEATURE_STATUS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/FEATURE_STATUS.md"
	install -Dm644 "SUGGESTIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SUGGESTIONS.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
