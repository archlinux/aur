# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=M-Igashi
_pkgname=mp3rgain
pkgname=${_pkgname}-bin
pkgdesc="Lossless MP3 volume adjustment - A modern 'mp3gain' replacement"

pkgver=2.6.2
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
            'b715e3e90cd51b66f06c46ea6f2eef8491ce34b2bfb9f850d6263ea76f193f7c'
            'af454cef96a4a790f7c773c3e79546120a55791ca89fb1776263f124fd3df1c6')
sha256sums_x86_64=('78c4617a419c75649a5905847e4b47842d2f3ea23c921a3bf84b04bcc20e14c3')
sha256sums_aarch64=('a572be5a497cf401fd1e8c2ffbcdd216e0b3dbb6b4a35a38b436f30702175b4b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
