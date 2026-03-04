# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dd86k
_pkgname=ddhx
pkgname=${_pkgname}-bin
pkgver=0.9.0
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
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('6c1491e43ffaa71c230ffc0adfe9cf31b3c9b38bf41dfd02143f8901b976af2a'
            'b15c1f4f73c4202b111aa49669bf69c15c5045a985ec89d2dc83feaddbd52595')
sha256sums_x86_64=('63c17f7abaac6da8254a89c56a16a3d4860cd5b7662efebff61f0d9a94e583df')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
