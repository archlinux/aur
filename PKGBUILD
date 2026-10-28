# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=involvex
_pkgname=youtube-music-cli
pkgname=${_pkgname}-bin
pkgdesc="A powerful Terminal User Interface (TUI) music player for YouTube Music"

pkgver=0.3.6
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
sha256sums=('c934edcd6d93de7e7e24072fb91e39f621d4e3c2e3f5a285767ed0f697c4f0bd'
            'dc17d0ea8f5b21fcf380b635aa535a094e3686d1734db6bc81a9c60bbfd4d92f'
            '8e0fa698e1e37adc44d567345a8db5e099f99c78e13123d631416a3813c6832e')
sha256sums_x86_64=('fa8eeb91a2f450b811c107f551bff4595df0d0d57771b555f07918a9cff30cc8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "SUGGESTIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SUGGESTIONS.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
