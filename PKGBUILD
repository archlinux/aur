# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

_buildnum=07027855
pkgname=niri-bin
pkgver=0.1.2
pkgrel=1
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
source_aarch64=(https://download.copr.fedorainfracloud.org/results/yalter/${pkgname%-bin}/fedora-40-${CARCH}/${_buildnum}-${pkgname%-bin}/${pkgname%-bin}-${pkgver}-1.fc40.${CARCH}.rpm)
source_x86_64=(https://download.copr.fedorainfracloud.org/results/yalter/${pkgname%-bin}/fedora-40-${CARCH}/${_buildnum}-${pkgname%-bin}/${pkgname%-bin}-${pkgver}-1.fc40.${CARCH}.rpm)
b2sums_aarch64=('3fccdd2b103ba74517f1585e65677cd5cf9af5fcfb82423a47241fddd49a0b1f6d2e377a446b515373a644859eed197d6c26a5dfc4b786830775bfdf6c8468e6')
b2sums_x86_64=('e4b99e7a1acd8853aa2049cdb8c4d75d74150f009bf7383c25b9375dcf8fe3e1b57e29c356989542190da3147b7a5b763d695ba58f126042fe870d2ef66aee5d')

package() {
  install -Dm755 usr/bin/${pkgname%-bin}{,-session}                        -t ${pkgdir}/usr/bin/
  install -Dm644 usr/share/wayland-sessions/${pkgname%-bin}.desktop        -t ${pkgdir}/usr/share/wayland-sessions/
  install -Dm644 usr/share/xdg-desktop-portal/${pkgname%-bin}-portals.conf -t ${pkgdir}/usr/share/xdg-desktop-portal/
  install -Dm644 usr/lib/systemd/user/${pkgname%-bin}.service              -t ${pkgdir}/usr/lib/systemd/user/
  install -Dm644 usr/lib/systemd/user/${pkgname%-bin}-shutdown.target      -t ${pkgdir}/usr/lib/systemd/user/
}
