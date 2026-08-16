# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=fygar256
_gitname=bi
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Binary editor like vI"

pkgver=3.5.2.33
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
sha256sums=('e4db0bdc24682a00d9bc32b25bfe468667ba1d792b25c761bb79d6418bfa347c')

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_gitsuffix}/" || exit

	install -Dm755 "${_appname}.py" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.1.gz" "${pkgdir}/usr/share/man/man1/${_appname}.1.gz"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

