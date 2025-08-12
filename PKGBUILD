# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=walles
_pkgname=moor
pkgname=${_pkgname}-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' 'i686' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('BSD-2-Clause-Views')

replaces=('moar' 'moar-bin')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.1::${_urlraw}/${_pkgname}.1"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"MOUSE-${pkgver}.md::${_urlraw}/MOUSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[0]}")
source_i686=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[2]}")
sha256sums=('7f00cf395f59f4cb47ede201945488e481cd2dc44ed095e1edf573811f0373ab'
            'f5f073e5c2be82c3e2cb7e0b67a5a72c7f563f08bf7e45da3ed05b8c1358d45c'
            '3908cd49ddb57a1cbe43b0d9ef8f7cfc9c0cee1fb4f6d34982890d35e180cacf'
            '80a4e70ea1dec5701034e0e535a8787a4e0d4deb5945ca9d5e2133b4588fbf8d')
sha256sums_x86_64=('6304351e76cbc43ba91e4dcd19ccafa9aa18081a254ac07260e9d0e7ac1b97b4')
sha256sums_i686=('6304351e76cbc43ba91e4dcd19ccafa9aa18081a254ac07260e9d0e7ac1b97b4')
sha256sums_aarch64=('6304351e76cbc43ba91e4dcd19ccafa9aa18081a254ac07260e9d0e7ac1b97b4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "MOUSE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/MOUSE.md"
}
