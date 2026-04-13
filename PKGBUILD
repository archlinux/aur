# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: David Birks <david@birks.dev>

_gitauthor=matheus-git
_gitname=systemd-manager-tui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A TUI application for managing systemd services"

pkgver=1.2.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('0f905726241c59bb0bd0353310bbb15c3c3abcfb60327a7be5a42269e36c12b2'
            '206b0efe09be5fb152102c47679ebb83a522e4bea18db16cd524a52e23a50db7')
sha256sums_x86_64=('63a977112f97462d55a4e41fc0280d32b3f801c3b9f0fad329cd79843c7ae1ec')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
