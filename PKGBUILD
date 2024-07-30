# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=tokentool-bin
_pkgname=TokenTool
 pkgver=2.2.2
pkgrel=2
pkgdesc="A Token creation tool to create png images suitable for Virtual Table Tops."
arch=('x86_64')
url="http://rptools.net"
license=('AGPL-3.0-or-later')
provides=('tokentool')
conflicts=('tokentool')
install=tokentool-bin.install
source=("https://github.com/RPTools/${_pkgname}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('5e544b38a7d0f12af0016d82ceb1e7e7c555a97b8e5755170df8379a49bff3aa')

package() {

	tar --extract --zstd --file data.tar.zst -C "${pkgdir}"
	install -d "${pkgdir}/usr/bin"
	install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	ln -s "/opt/tokentool/bin/${_pkgname}" "${pkgdir}/usr/bin/tokentool"
}
