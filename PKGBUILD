# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=M-Igashi
_pkgname=mp3rgain
pkgname=${_pkgname}-bin
pkgdesc="Lossless MP3 volume adjustment - A modern 'mp3gain' replacement"

pkgver=3.0.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"${_pkgname}-${pkgver}.1::${_urlraw}//docs/man/${_pkgname}.1")
source_x86_64=("${_pkgname}-x86_64-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-aarch64-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-arm64.tar.gz")
sha256sums=('8e557208f0bd83f91b38dcc81ccf914c4c84060ab6dbc5072dbf369791ffc135'
            'c875b1f974e4e96fd2901bee2518f586d34710b46853555f378574f59d383905'
            '3eeaf2fbd2563a76e80a5c047c1d800542e6c18c0563e93505c8630ea3bd9611')
sha256sums_x86_64=('f004a0552d6bfb3668959cf0895e9c0bf66bc6d537e9c06d7eb4aeaccb44ce3d')
sha256sums_aarch64=('ad5c875ca076eb8c5457364218f88be15dc9d88ca9b7c95e054c0df350ae083d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
