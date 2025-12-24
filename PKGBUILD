# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dd86k
_pkgname=ddhx
pkgname=${_pkgname}-bin
pkgver=0.8.1
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Console hexadecimal file viewer"
arch=('x86_64')
_barch=('x86_64-linux-musl-static')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
sha256sums=('38368893e6b716941036d2175add984a5501dd183ba9f26aaa5cc86e2bdddf73'
            'b9092231a07886e1a4c050cd35dde87d794f0cf89b471a995f1b50f12a6e8089')
sha256sums_x86_64=('0d88f32f73c74b2b5c60c1e8da989235c4f965b8a10f81038ff16ed29a9f2139')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
