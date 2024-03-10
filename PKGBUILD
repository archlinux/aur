# Maintainer: Peter Fern <aur at 0xc0dedbad dot com>

pkgname=hyprpanel-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.3
pkgrel=1
pkgdesc="An opinionated panel/shell for the Hyprland compositor."
arch=('x86_64' 'aarch64')
url="https://github.com/pdf/hyprpanel"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
depends=('gtk4' 'gtk4-layer-shell' 'hyprland')
optdepends=('systemd: logging support'
	'pulse-native-provider: volume control support'
	'upower: battery status support')
_src="${url}/releases/download/v${pkgver}/hyprpanel_Linux"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_src}_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_src}_arm64.tar.gz")
sha256sums_x86_64=('60d24678175447a40c8ce31462485181bb6a66f2d798046d7e558468da0e3959')
sha256sums_aarch64=('0f993c3ee77c3d64f8508fa90eb78f76c8b3031f29677e4bb0501cb958c065bd')

package() {
	install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}-client" "${pkgdir}/usr/bin/${_pkgname}-client"
}

# vim:set ts=2 sw=2 et:
