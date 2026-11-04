# Maintainer: Masanari Higashi <m-igashi@users.noreply.github.com>

_pkgauthor=M-Igashi
_pkgname=baken
pkgname=${_pkgname}-bin
pkgdesc="Bake'n Deck - Rekordbox to CDJ prep toolkit: loudness gain, Key+BPM playlist sort, and CDJ-safe MP3 transcode"

pkgver=4.9.0
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
sha256sums=('08e71ca36a425ca384c0c028fa9ee04f2de6caceee94ba539cb0f9c7715e6e89'
            '6ec9c46bf79d746541192832460b8d93af313917be8910b7de7caa5c235d22e3')
sha256sums_x86_64=('e2a8cdf3361b29a491514b490ebcfa0a956079aa0de1b197fd1a511a97aca815')
sha256sums_aarch64=('1f4e864c7121d9cecb283072605040f43b790b02324fc8432d39c2eff1870738')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
