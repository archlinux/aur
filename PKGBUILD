# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=weedonandscott
_pkgname=trolley
pkgname=${_pkgname}-bin
pkgdesc="Run terminal apps anywhere "

pkgver=0.11.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux' 'aarch64-linux')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-cli-${_barch[0]}.tar.xz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-cli-${_barch[1]}.tar.xz")
sha256sums=('8d536350f991f3fcf916b0d5e3414847420cb7b1ec4ec54a4712857070edd615'
            '2bb07097d1c114203af61b79528e410ce5849546f42650edb4bfcdbe74b137ef')
sha256sums_x86_64=('d548ff705aa459fa79806ed11266e05420bd6cfaa1ee4b815b3093c66da59bc4')
sha256sums_aarch64=('86d94e5023475857a1981ecd61005505e0553e7fdae3e0039dbefa058ac7d7f1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
