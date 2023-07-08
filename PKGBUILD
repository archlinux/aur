# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.1
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal (binary version)."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://getclipboard.app"
license=('GPL3')
depends=('alsa-lib')
optdepends=('libx11: X11 support'
	    'wayland: Wayland support'
	    'wayland-protocols: Wayland support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-amd64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-arm64.zip")
source_riscv64=("${_pkgname}-${pkgver}-riscv64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-riscv64.zip")
sha256sums_x86_64=('cece02fc5ced7cdbc95bf6966e4cb3ffb8b243fe27231c9f9dfdcd94b08818c0')
sha256sums_aarch64=('b1b6ab1b61e6d99836517dd3b4680e67135b45991a6cf1e506e268ca0ccd2fd2')
sha256sums_riscv64=('f753694720c74f98818cb855449d017fa06ba4e65a2e7402a4c5aa219b3d73b8')

package() {

	if [ "${CARCH}" = "x86_64" ]; then
		install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
	fi

	install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"
	install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}
