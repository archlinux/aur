# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.10.0
pkgrel=1
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
sha256sums_x86_64=('23a654c05aee16a0945eb933d5466122c38bdbc9aa39f6dd168d25bf51591441')
sha256sums_aarch64=('aad8a3057f568afaddb091ffbb8b9d4af95e3d01bb6d182243c3a1d3dec3a60a')
sha256sums_riscv64=('5253566df73265e11ce24f82892933b998f561b912dcc834f4a10c56c271e042')

package() {

	if [ "${CARCH}" = "x86_64" ]; then
		install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
	fi

	install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"
	install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}
