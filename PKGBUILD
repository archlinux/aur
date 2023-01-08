# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.1r2
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal (binary version)."
arch=('x86_64')
url="https://github.com/Slackadays/Clipboard"
license=('GPL3')
optdepends=('libx11: X11 support'
	    'wayland: Wayland support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}-amd64.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
sha256sums=('6933e3c0e07732464a9f5ac8ea0c429d615637c61cf7144feafdf42f13599b4b')

package() {
	install -Dm 755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/cb"
}
