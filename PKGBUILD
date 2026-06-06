# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dd86k
_pkgname=binco
pkgname=${_pkgname}-bin
pkgver=0.3.1
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
            '0cb42b8d4739edde8e17b33e7c79e79e987b21c5e44d296a732a86d7dcde87bc')
sha256sums_x86_64=('0217505ce34410d4b30b115fa065888499e572c83ab499f810b52a6fc3aaed0a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
