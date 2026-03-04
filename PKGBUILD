# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dd86k
_pkgname=binco
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Binary-Text Encoder-Decoder"

arch=('x86_64')
_barch=('x86_64-linux-musl-static')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('2d712644ddda1385230a1612324733541dbfc645132bb22d6bf55a8282a2f1b5'
            '1c190272d4b8d05eabc48d304797c02478e473fb04b280d147eab85a8ffa0e9a')
sha256sums_x86_64=('1da6e21f48ead0a0c1b16d6823fcc977eaecf1c072d6f5f513d178b5e3837bf7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
