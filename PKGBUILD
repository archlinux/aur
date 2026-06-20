# Maintainer: jtaw5649
pkgname=waybar-hyprspaces-fork-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Prebuilt Waybar fork with hyprspaces paired workspace support"
arch=('x86_64')
url='https://github.com/jtaw5649/Waybar'
license=('MIT')
depends=(
  'atkmm'
  'cairomm'
  'fmt'
  'glib2'
  'glibc'
  'glibmm'
  'gtk-layer-shell'
  'gtk3'
  'gtkmm3'
  'jack'
  'jsoncpp'
  'libcava'
  'libdbusmenu-gtk3'
  'libepoxy'
  'libevdev'
  'libgcc'
  'libinput'
  'libmpdclient'
  'libnl'
  'libpipewire'
  'libpulse'
  'libsigc++'
  'libstdc++'
  'libwireplumber'
  'libxkbcommon'
  'playerctl'
  'sndio'
  'spdlog'
  'systemd-libs'
  'upower'
  'waybar'
  'wayland'
)
provides=('waybar-hyprspaces-fork')
conflicts=('waybar-hyprspaces-fork')
options=('!debug')
_release_tag="hyprspaces-v${pkgver}"
_asset="waybar-hyprspaces-fork-x86_64.tar.zst"
_commit='8e83dc3315bb4631adf158b73d571080afe5c4a9'
source=(
  "${url}/releases/download/${_release_tag}/${_asset}"
  "LICENSE::https://raw.githubusercontent.com/jtaw5649/Waybar/${_commit}/LICENSE"
)
sha256sums=(
  '2aa490333910d9c53a0910adad8f58b7edd772003a2f76c581c48fb447cbeed5'
  'cf9f7af35361d9e0af784fb60a1ed8be5bb939233fbd70671575a90e458db00e'
)

package() {
  install -Dm755 "${srcdir}/waybar" "${pkgdir}/usr/lib/hyprspaces/waybar-fork/bin/waybar"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
