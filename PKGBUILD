# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.1
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
sha256sums_x86_64=('3d9772a03f9d9d5b1d406103e86eb0bffe15684337f452b73b97d38680b80580')
sha256sums_aarch64=('a994e24633e889f2b8a16bce29a0543bbd945fb796dac9c9c87b47e1a80c6cda')
sha256sums_riscv64=('6b7348cb1f523cd79c1044bd0ec60b5c3e8afdbc8c4f3c78a8cbe13d13e658f8')

package() {

	if [ "${CARCH}" = "x86_64" ]; then
		install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
	fi

	install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"
	install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}
