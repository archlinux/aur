# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=5hubham5ingh
_pkgname=js-util
_appname=js
pkgname=${_pkgname}-bin
pkgdesc="Run multiple commands in parallel"

pkgver=1.24.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_appname}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}")
sha256sums=('100b1fceb238898b9cd3f9821b2459a6f304be67c1d08a05b29349b64531111c'
            '98b66e9cf11f258f2909f5db8fd7b123caff94ce17ad411cfc29e12594970da1')
sha256sums_x86_64=('f78ee051e763998c4f034803afbf09a5bae8b25f9e6cd3e663c8474b8b80cbae')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
