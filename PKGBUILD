# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.0
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal (binary version)."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://getclipboard.app"
license=('GPL3')
optdepends=('libx11: X11 support'
	    'wayland: Wayland support'
	    'wayland-protocols: Wayland support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-amd64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-arm64.zip")
source_riscv64=("${_pkgname}-${pkgver}-riscv64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-riscv64.zip")
sha256sums_x86_64=('c9d0cef0b87436115f313c10099585381faf609d01d3276a73c912fcde9f78f4')
sha256sums_aarch64=('e3566c8c915bd7f88070bf72f20e1b1bdc56b37ba18c1406c1734c8305f1a4c5')
sha256sums_riscv64=('113bb0ae7e7a70884cbb5a478e2d96c943ae769e23340657c07340a2783fa6a9')

package() {

	if [ "${CARCH}" = "x86_64" ]; then
		install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
	fi

	install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"
	install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}
