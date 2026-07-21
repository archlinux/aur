# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=weedonandscott
_pkgname=trolley
pkgname=${_pkgname}-bin
pkgdesc="Run terminal apps anywhere "

pkgver=0.8.0
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
sha256sums=('e6cfdadda0846b9434d97a940485d4032836ce95dd5cbcc18ff04cff36004e0f'
            '2bb07097d1c114203af61b79528e410ce5849546f42650edb4bfcdbe74b137ef')
sha256sums_x86_64=('d394bde0f1e8f091307e1e4577a1441b6eca2ed423c7b3b6f109769e6b12516b')
sha256sums_aarch64=('429133588d00020eaa36ccacac24a909cf8f4d4a1188fc5d168da33351a0db89')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
