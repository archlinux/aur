# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

_buildnum=07028387
pkgname=niri-bin
pkgver=0.1.2
pkgrel=2
pkgdesc="Scrollable-tiling Wayland compositor"
arch=(aarch64 x86_64)
url="https://github.com/YaLTeR/${pkgname%-bin}"
license=(GPL-3.0-or-later)
depends=(cairo glib2 libinput libpipewire libxkbcommon mesa pango pixman seatd)
optdepends=('fuzzel: application launcher similar to rofi drun mode'
            'waybar: highly customizable Wayland bar'
            'alacritty: a cross-platform OpenGL terminal emulator'
            'mako: notification daemon for Wayland'
            'swaybg: wallpaper tool for Wayland compositors'
            'swaylock: screen locker for Wayland'
            'xdg-desktop-portal-gtk: implements most of the basic functionality'
            'xdg-desktop-portal-gnome: screencasting support'
            'gnome-keyring: implements the secret portal, for certain apps to work'
            'polkit-gnome: when apps need to ask for root permissions')
conflicts=(${pkgname%-bin}-git ${pkgname%-bin})
options=(!debug)
source_aarch64=(https://download.copr.fedorainfracloud.org/results/yalter/${pkgname%-bin}/fedora-40-${CARCH}/${_buildnum}-${pkgname%-bin}/${pkgname%-bin}-${pkgver}-2.fc40.${CARCH}.rpm)
source_x86_64=(https://download.copr.fedorainfracloud.org/results/yalter/${pkgname%-bin}/fedora-40-${CARCH}/${_buildnum}-${pkgname%-bin}/${pkgname%-bin}-${pkgver}-2.fc40.${CARCH}.rpm)
b2sums_aarch64=('29460b00864d25f2ef86825c6a8a87bb583111f8addc402be97b1a802194fe1038281b1e5a8e06a8905661d305d290ce9bb84f5e2388da690163bf87563ae789')
b2sums_x86_64=('9a87d2c3abe5d5276d51ad288225812d24501a51cde9eee7dd9c5227ec1fd2e239e366a40316d398ae32eb43cedc0fb863a8e8c9b5f01f43ac494f8de764192f')

package() {
  install -Dm755 usr/bin/${pkgname%-bin}{,-session}                        -t ${pkgdir}/usr/bin/
  install -Dm644 usr/share/wayland-sessions/${pkgname%-bin}.desktop        -t ${pkgdir}/usr/share/wayland-sessions/
  install -Dm644 usr/share/xdg-desktop-portal/${pkgname%-bin}-portals.conf -t ${pkgdir}/usr/share/xdg-desktop-portal/
  install -Dm644 usr/lib/systemd/user/${pkgname%-bin}.service              -t ${pkgdir}/usr/lib/systemd/user/
  install -Dm644 usr/lib/systemd/user/${pkgname%-bin}-shutdown.target      -t ${pkgdir}/usr/lib/systemd/user/
}
