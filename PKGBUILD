# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=fygar256
_gitname=bi
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Binary editor like vI"

pkgver=3.5.2.0
pkgrel=1
_gitsuffix=stable
_gitversion=v${pkgver}-${_gitsuffix}

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

arch=('any')
license=('MIT')

depends=('python')

source=("${_appname}-${pkgver}.zip::${_ghurl}/archive/refs/tags/${_gitversion}.zip")
sha256sums=('85bf6e24eafb9f414adbb551f27e2ecf299157d791b194b7635b0b1066ec4ddb')

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_gitsuffix}/" || exit

	install -Dm755 "${_appname}.py" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.1.gz" "${pkgdir}/usr/share/man/man1/${_appname}.1.gz"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

