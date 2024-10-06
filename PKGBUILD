# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.9.1
pkgrel=2
pkgdesc="Cut, copy, and paste anything in your terminal (binary version)."
url="https://getclipboard.app"
arch=('x86_64' 'aarch64' 'riscv64')
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'openssl')
optdepends=('libx11: X11 support'
	    'wayland: Wayland support'
	    'wayland-protocols: Wayland support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-amd64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-arm64.zip")
source_riscv64=("${_pkgname}-${pkgver}-riscv64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-riscv64.zip")
sha256sums_x86_64=('20d616468b3b3e06c5434331c83b102ad86af101c9d94887c315d0e3497e8a0f')
sha256sums_aarch64=('ac0ffb7cbbdb1c9ed43c52171c50b0a60546f3438af11c767a4fcefe319a95b1')
sha256sums_riscv64=('5fba87633d04887029cf3b3cb63cc10cc294a7b2de3c169e8dfb82a959f5d7fe')

package() {

	if [ "${CARCH}" = "x86_64" ]; then
		install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
	fi

	install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"
	install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}
