# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=emcrisostomo
_gitname=fswatch
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A cross-platform file change monitor with multiple backends: Apple OS X File System Events API, *BSD kqueue, Linux inotify, Microsoft Windows and a stat-based backend"

pkgver=1.22.0
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64')
_barch=('linux-x86_64-static')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('0585e44f0146fba2e3b1249c196c4fda7f0c7ae5f9de2c98014b4c42c29c4735')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.binary" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
