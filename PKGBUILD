# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=involvex
_pkgname=youtube-music-cli
pkgname=${_pkgname}-bin
pkgdesc="A powerful Terminal User Interface (TUI) music player for YouTube Music"

pkgver=0.3.13
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'mpv' 'yt-dlp')

source=("SUGGESTIONS-${pkgver}.md::${_urlraw}/SUGGESTIONS.md"
		"README-${pkgver}.md::${_urlraw}/readme.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}")
sha256sums=('f54e8bddf858dd9fb6779aae857835810378aa5418a7d8292875799c645d08f8'
            '3c78d492df7e3ff817be0448098c593e53260a01b9f1f2374cbbc80dcd8a3000'
            '8e0fa698e1e37adc44d567345a8db5e099f99c78e13123d631416a3813c6832e')
sha256sums_x86_64=('14a2b1b7ef7aa70a5ba01aab2193c7445497ae75b77760b13ecbd261b67e143f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "SUGGESTIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SUGGESTIONS.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
