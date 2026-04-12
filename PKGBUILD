# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=fygar256
_gitname=bi
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Binary editor like vI"

pkgver=3.5.1.65
pkgrel=1
_gitversion=v${pkgver}-stable

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

arch=('any')
license=('MIT')

depends=('python')

source=("${_appname}-${pkgver}.zip::${_ghurl}/archive/refs/tags/${_gitversion}.zip")
sha256sums=('e27bda972d9e65de09a34fa3c9d28cf018a6b9fd27ef3548519c5cb4a1cb90a0')

package() {
	cd "${srcdir}/${_appname}-${pkgver}-stable/" || exit

	install -Dm755 "${_appname}.py" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.1.gz" "${pkgdir}/usr/share/man/man1/${_appname}.1.gz"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

