# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=M-Igashi
_pkgname=mp3rgain
pkgname=${_pkgname}-bin
pkgdesc="Lossless MP3 volume adjustment - A modern 'mp3gain' replacement"

pkgver=1.3.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${arch[0]}.tar.gz")
sha256sums=('8e557208f0bd83f91b38dcc81ccf914c4c84060ab6dbc5072dbf369791ffc135'
            'e0ab471109964297504a093afe55140ae64cf1ee205babb75421426847a72839')
sha256sums_x86_64=('a29c198782f28517b0b2779023e0d002fa0a5a762e988bda178fb1591d752d0f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
