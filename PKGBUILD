# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=kopecmaciej
_gitname=vi-mongo
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="MongoDB TUI manager designed to simplify data visualization and quick manipulation"

pkgver=0.3.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('Linux_x86_64' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('aeedb914189a631ef110473348a31fc4aaee80eac0dc3b3ffa163e25abe8f1f1')
sha256sums_aarch64=('dacf1f4c59967c409d64420bea4a88af335ef1e8712d87a74db047521a4be677')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
