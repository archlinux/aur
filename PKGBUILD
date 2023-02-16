# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=tokentool-bin
_pkgname=TokenTool
 pkgver=2.2.1
pkgrel=1
pkgdesc="A Token creation tool to create png images suitable for Virtual Table Tops."
arch=('x86_64')
url="http://rptools.net"
license=('AGPL3')
provides=('tokentool')
conflicts=('tokentool')
install=tokentool-bin.install
source=("https://github.com/RPTools/${_pkgname}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('2b310a0a477e9ee3c5fabcab0b38aad4e79952683e37269144ce66d73d575f17')

package() {

	tar -xJf data.tar.xz -C "${pkgdir}"
	install -d "${pkgdir}/usr/bin"
	install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	ln -s "/opt/tokentool/bin/${_pkgname}" "${pkgdir}/usr/bin/tokentool"
}
