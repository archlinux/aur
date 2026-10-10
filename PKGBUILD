# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: David Birks <david@birks.dev>

_gitauthor=matheus-git
_gitname=systemd-manager-tui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A TUI application for managing systemd services"

pkgver=1.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('3b7f50ec8d0b04d6006927e8b8f64f81e0afa50c8c00a0588c3822778f8888e6'
            '206b0efe09be5fb152102c47679ebb83a522e4bea18db16cd524a52e23a50db7')
sha256sums_x86_64=('942ecacc15481843d59db1c846e8996a26528a334e43eded00f0f0c202e8dfdc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
