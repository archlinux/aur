# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=utkarsh261
_gitname=pho
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="TUI for Github Pull Requests"

pkgver=0.1.43
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_.amd64' 'linux_.arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

depends=('github-cli')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('5caeb50d3882892d1d8eaffeb1a0d449ef4b0387d5d85acb7ef587f52a8c51a5')
sha256sums_aarch64=('a4d97d69c714228b02620ff2556c644fed744e2476fa24d9de23b45c629d7d8e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
