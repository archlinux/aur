# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=radii5
_pkgname=music
pkgname=${_pkgauthor}-bin
pkgdesc="CLI music downloader powered by yt-dlp with parallel chunk downloading and automatic ID3 tagging"

pkgver=0.3.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgauthor}")
conflicts=("${_pkgauthor}")
depends=('ffmpeg' 'yt-dlp' 'deno')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgauthor}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgauthor}-${_barch[0]}")
source_aarch64=("${_pkgauthor}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgauthor}-${_barch[1]}")
sha256sums=('4a6260f06d441975156b1fef76b076f0825e27874509152490b92c28a9de571c'
            'ecc5ba38ce439ae76319a651a9e4f84671fb2d2ed1ed3f4c0c10eccce8b491e6')
sha256sums_x86_64=('f8d4ef14d4154396b739fc55415e487f8193127692bf96ff2408f421b7618603')
sha256sums_aarch64=('8779e969c7e720501b10a995214980ef2edffc56c67627ad4654a873d7e66fd8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgauthor}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgauthor}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
