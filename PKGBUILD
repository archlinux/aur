# Maintainer: Masanari Higashi <m-igashi@users.noreply.github.com>

_pkgauthor=M-Igashi
_pkgname=baken
pkgname=${_pkgname}-bin
pkgdesc="Bake'n Deck - Rekordbox to CDJ prep toolkit: loudness gain, Key+BPM playlist sort, and CDJ-safe MP3 transcode"

pkgver=4.14.0
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
            '732326c5ff932c49ab3f2889582114568b0526fa20d39bcfa64420e95b2a3b9d')
sha256sums_x86_64=('4bb6dc7842d2f0a2b9b143438ba827442ba71c517d1633ba3f960ab3714b2a4d')
sha256sums_aarch64=('c08aca5f272a261916e557784b37e3896a438763bc98f40e212df784d7a00b30')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
