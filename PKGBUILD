# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

_buildnum=06983364
pkgname=niri-bin
pkgver=0.1.1
pkgrel=3
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
source_aarch64=(https://download.copr.fedorainfracloud.org/results/yalter/${pkgname%-bin}/fedora-39-${CARCH}/${_buildnum}-${pkgname%-bin}/${pkgname%-bin}-${pkgver}-1.fc39.${CARCH}.rpm)
source_x86_64=(https://download.copr.fedorainfracloud.org/results/yalter/${pkgname%-bin}/fedora-39-${CARCH}/${_buildnum}-${pkgname%-bin}/${pkgname%-bin}-${pkgver}-1.fc39.${CARCH}.rpm)
b2sums_aarch64=('54fad08a8f9813c78233aad8c7fa9551595a6614e4c70b9a6a4a15f06eb90b96f190014db3204e3cb5bc214cffafd83c7be6ac60a5835b0a2756bafb1cd81018 ')
b2sums_x86_64=('5df7da32a2e44a821011eaa0647851f26e8edc52beefa3d94a3a1458b368e9ed1b562e5100f66b7cb39a3087907fce3dc2dbf6bca37169374004713a9b34f3e7')

package() {
  install -Dm755 usr/bin/${pkgname%-bin}{,-session}                        -t ${pkgdir}/usr/bin/
  install -Dm644 usr/share/wayland-sessions/${pkgname%-bin}.desktop        -t ${pkgdir}/usr/share/wayland-sessions/
  install -Dm644 usr/share/xdg-desktop-portal/${pkgname%-bin}-portals.conf -t ${pkgdir}/usr/share/xdg-desktop-portal/
  install -Dm644 usr/lib/systemd/user/${pkgname%-bin}.service              -t ${pkgdir}/usr/lib/systemd/user/
  install -Dm644 usr/lib/systemd/user/${pkgname%-bin}-shutdown.target      -t ${pkgdir}/usr/lib/systemd/user/
}
