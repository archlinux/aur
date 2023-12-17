# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.9.0.1
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
sha256sums_x86_64=('5b90cd7299c1c0d679cfe8c1bd4e89e7fd70ebede2890d90a6f1da98a90e922b')
sha256sums_aarch64=('07493b5e9954585160fc54314e23e4897652f06594f6ec7ceba66b32d7f72b82')
sha256sums_riscv64=('e92f2c4eeeefd093d25f91f186c1c3ac572ea254369fe7028928246d431407c8')

package() {

	if [ "${CARCH}" = "x86_64" ]; then
		install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
	fi

	install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"
	install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}
