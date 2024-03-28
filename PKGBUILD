# Maintainer: Peter Fern <aur at 0xc0dedbad dot com>

pkgname=hyprpanel-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.7
pkgrel=1
pkgdesc="An opinionated panel/shell for the Hyprland compositor."
arch=('x86_64' 'aarch64')
url="https://github.com/pdf/hyprpanel"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
depends=('gtk4' 'gtk4-layer-shell' 'hyprland>=0.37.0')
optdepends=('systemd: logging support'
	'pulse-native-provider: volume control support'
	'upower: battery status support')
_src="${url}/releases/download/v${pkgver}/hyprpanel_Linux"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_src}_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_src}_arm64.tar.gz")
sha256sums_x86_64=('f403b2b9a0adb99d72ba8d879e178d5c3918ae5f6e4d0f1ed5500c1efa0112a7')
sha256sums_aarch64=('cebaf000ebbcf970ed93b7b5e47945907c31c0d1e9d836a613a18348e951116f')

package() {
	install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}-client" "${pkgdir}/usr/bin/${_pkgname}-client"
}

# vim:set ts=2 sw=2 et:
