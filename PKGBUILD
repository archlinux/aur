# Maintainer: Masanari Higashi <m-igashi@users.noreply.github.com>

_pkgauthor=M-Igashi
_pkgname=baken
pkgname=${_pkgname}-bin
pkgdesc="Bake'n Deck - Rekordbox to CDJ prep toolkit: loudness gain, Key+BPM playlist sort, and CDJ-safe MP3 transcode"

pkgver=4.7.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

replaces=('headroom')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'headroom')

depends=('glibc' 'libgcc' 'ffmpeg')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.tar.gz")
sha256sums=('45f62ea4b8704c36e13c62bdafb15076fc8bf618b9722496534193700a7f61bc'
            '0d617139549c0398b0ab692b785e3a067f2134663df70613c6d45bde5345f9c3')
sha256sums_x86_64=('661193e2d16b11c4fcf02d84975d136b85ea060954e32174bfa74c02194bc5b6')
sha256sums_aarch64=('784fa72a866536ddd9e4926581e35a82e359f53826bd7880eb1952303cda06a3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
