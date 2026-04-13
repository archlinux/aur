# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=radii5
_pkgname=music
pkgname=${_pkgauthor}-bin
pkgdesc="CLI music downloader powered by yt-dlp with parallel chunk downloading and automatic ID3 tagging"

pkgver=0.4.1
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
sha256sums=('3e355bccd4bb9626df15b26b66b71d0c2db1e817329b831a63f164e949ca30c6'
            'ebe9a425cdef37b016deeaba2f99f3a51464fdb126c88d79ce579c0dc8c7b82e')
sha256sums_x86_64=('eda9d05093bb0d15229cfb8c378da829d5db1886fa4e94d23f9e5d88d4ae22de')
sha256sums_aarch64=('6b33a1548430840906da88d22d53f74f1ffba674b00604301ff8e4ddc406600e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgauthor}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgauthor}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
