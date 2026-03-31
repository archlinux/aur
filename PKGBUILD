# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bjarneo
_pkgname=cliamp
pkgname=${_pkgname}-bin
pkgdesc="A retro terminal music player inspired by Winamp 2.x"

pkgver=1.31.6
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
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('496b452b505e5b16a5aa94ed752304ab55bf16095df31560364f7b7ee676bc80'
            '57764ebae827c1c96dc5c1b74e2579ff34d3abcaabb54f5e5498fb2f612330cc')
sha256sums_x86_64=('3b1a9c28cac4e064d4f2071a3044813b5f9da94ea342decd8488e4e6d8fb826e')
sha256sums_aarch64=('5e6296a8f5c9b1bfb442baaf90a792ba25c3ac45246d05b6d31e1a9bd5842d5a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
