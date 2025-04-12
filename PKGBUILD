# Maintainer: Peter Fern <aur at 0xc0dedbad dot com>

pkgname=hyprpanel-bin
_pkgname=${pkgname%-bin}
pkgver=0.3.0
pkgrel=1
pkgdesc="An opinionated panel/shell for the Hyprland compositor."
arch=('x86_64' 'aarch64')
url="https://github.com/pdf/hyprpanel"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
depends=('gtk4' 'gtk4-layer-shell' 'hyprland>=0.42.0')
optdepends=('uwsm: wayland session support'
  'pulse-native-provider: volume control support'
  'upower: battery status support')
_src="${url}/releases/download/v${pkgver}/hyprpanel_Linux"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_src}_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_src}_arm64.tar.gz")
sha256sums_x86_64=('a964c417117fdea5c0d31663cdd2709ffe603f660cf1acb1582c918a57d9ed7d')
sha256sums_aarch64=('3d680c71254b4e5d493ed0d54c22990d56f65b9206e78803615a53144022733b')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${srcdir}/${_pkgname}-client" "${pkgdir}/usr/bin/${_pkgname}-client"
}

# vim:set ts=2 sw=2 et:
