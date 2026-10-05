# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=involvex
_pkgname=youtube-music-cli
pkgname=${_pkgname}-bin
pkgdesc="A powerful Terminal User Interface (TUI) music player for YouTube Music"

pkgver=0.3.1
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
            '176fea27e5b09c0588e8d7da3c8b348f4124ab3a3dfad6705ea37f531ecf603b'
            '8e0fa698e1e37adc44d567345a8db5e099f99c78e13123d631416a3813c6832e')
sha256sums_x86_64=('93e825911bf78964cd048eaa26870053398f5b8401ea079f8410e9e7f1a6ff3f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "SUGGESTIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SUGGESTIONS.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
