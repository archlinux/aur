# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=jaisuriya-11
_gitname=tsuzuri
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Block-based notebook for the terminal. Plain Markdown files, Vim editing, live preview, boards, calendars and 96 themes"

pkgver=0.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('0dfd1f7a492b26f2769385c96bc29908838c5e6ebf8d06bcb162f67522bde94f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
