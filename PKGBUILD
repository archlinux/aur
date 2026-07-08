# Maintainer: Masanari Higashi <m-igashi@users.noreply.github.com>

_pkgauthor=M-Igashi
_pkgname=baken
pkgname=${_pkgname}-bin
pkgdesc="Bake'n Deck - Rekordbox to CDJ prep toolkit: loudness gain, Key+BPM playlist sort, and CDJ-safe MP3 transcode (formerly headroom)"

pkgver=3.0.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}" 'headroom-bin')
replaces=('headroom-bin')
depends=('glibc' 'gcc-libs' 'ffmpeg')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-x86_64-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-aarch64-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-aarch64.tar.gz")
sha256sums=('6850b0e5d07bed32b3613d4c7da50e0fc36542239a5ff5188b524494e9edda75'
            'e7dd0e0caf012dc4a78df2b690a92a404b547def3693564b6243033a3f724674')
sha256sums_x86_64=('dd1e2b85b8b228399ef65fc45e4a643ef3c83c7b7db7f282669a559f25da989b')
sha256sums_aarch64=('4c80b68dc72b8eb301d15dacd2289216afc92e7a8554441e57b24134185ec5e4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
