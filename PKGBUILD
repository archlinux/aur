# Maintainer: Peter Fern <aur at 0xc0dedbad dot com>

pkgname=hyprpanel-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.10
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
sha256sums_x86_64=('0e5871f5e461e389169bdfee683bf1d7f2426d94cc385b397b5485eee282e858')
sha256sums_aarch64=('081df976ce957993a086e0bc987d1bffeaac55cec8466780cc49059813ed1f69')

package() {
	install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}-client" "${pkgdir}/usr/bin/${_pkgname}-client"
}

# vim:set ts=2 sw=2 et:
