# Maintainer: Masanari Higashi <m-igashi@users.noreply.github.com>

_pkgauthor=M-Igashi
_pkgname=baken
pkgname=${_pkgname}-bin
pkgdesc="Bake'n Deck - Rekordbox to CDJ prep toolkit: loudness gain, Key+BPM playlist sort, and CDJ-safe MP3 transcode"

pkgver=4.4.0
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
            'ef40e10234a8e8659f99e56462ce6d1557d3baf4e7560a2aa1dd32b9a30341e3')
sha256sums_x86_64=('7ec590e9b00bf28bb810d171c4ac264c7446c131f68e19d9e9d309c667468c0d')
sha256sums_aarch64=('0c7f4ea1d278e62d071bc628716fd6d997a380ead4183ae4ca0b7c6a4c0f1096')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
