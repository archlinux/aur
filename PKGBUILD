# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bjarneo
_pkgname=cliamp
pkgname=${_pkgname}-bin
pkgdesc="A retro terminal music player inspired by Winamp 2.x"

pkgver=1.47.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=('glibc' 'libgcc' 'ffmpeg' 'yt-dlp' 'flac' 'alsa-lib' 'libvorbis' 'libogg')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('1f0dc49e3567e3bd305d9c2b78026b92f05c21df701eab8572598bb5c807585e'
            '57764ebae827c1c96dc5c1b74e2579ff34d3abcaabb54f5e5498fb2f612330cc')
sha256sums_x86_64=('073f30e0f76e215956a23f1cccfcfdd51f8ed6a65e5e7bc80947b7f127981256')
sha256sums_aarch64=('df0686687de821dda459fa2167b6b2f2b80afc6eb405ea8f4ae2c67cd9c072f9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
