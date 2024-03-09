# Maintainer: Peter Fern <aur at 0xc0dedbad dot com>

pkgname=hyprpanel-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.2
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
_src="${pkgname}-${pkgver}-${CARCH}.tar.gz::${url}/releases/download/v${pkgver}/hyprpanel_Linux"
source_x86_64=("${_src}_x86_64.tar.gz")
source_aarch64=("${_src}_arm64.tar.gz")
sha256sums_x86_64=('8276c75b11d21a973eeba9fdac113b302c2ec82f6347200ec7a11207a2cf661c')
sha256sums_aarch64=('d3ed34f85291f7c064b45a2db702dcb1da0c7fd76117d775ddbf45e4bc32bf16')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}-client" "${pkgdir}/usr/bin/${_pkgname}-client"
}

# vim:set ts=2 sw=2 et:
