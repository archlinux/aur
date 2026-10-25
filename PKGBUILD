# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Slashas632
_gitname=goPort
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="Fast concurrent TCP/UDP port scanner in Go with Lua plugin support"

pkgver=1.3.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.zip")
sha256sums=('0f3155fdf76df9a2a13ec1262d73db245e8a25d4f091df634ab5e4a84533579c'
            '7a0001b054bdcae3bfc6b19aa5069aa101c6afb147449f66d1f956d461c3d2d5')
sha256sums_x86_64=('711cf72111f92a121b5275b971f64b752c5776c78809988db84359a12e6fa722')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_gitname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
