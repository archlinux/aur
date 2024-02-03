# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

_buildnum=06983364
pkgname=niri-bin
pkgver=0.1.1
pkgrel=2
pkgdesc="Scrollable-tiling Wayland compositor"
arch=(x86_64 aarch64)
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
source_x86_64=(https://download.copr.fedorainfracloud.org/results/yalter/${pkgname%-bin}/fedora-39-${CARCH}/${_buildnum}-${pkgname%-bin}/${pkgname%-bin}-${pkgver}-1.fc39.${CARCH}.rpm)
source_aarch64=(https://download.copr.fedorainfracloud.org/results/yalter/${pkgname%-bin}/fedora-39-${CARCH}/${_buildnum}-${pkgname%-bin}/${pkgname%-bin}-${pkgver}-1.fc39.${CARCH}.rpm)
sha256sums_x86_64=('6ff0ce6c29868733a140bdb5eb57f4445dc769700a638c6dc50ef08c4d25c97b')
sha256sums_aarch64=('db734939bbca6556af4ec144609a07d384dde9c8db110306c30f227ef4c42587')

package() {
  install -Dm755 usr/bin/${pkgname%-bin}{,-session}                        -t ${pkgdir}/usr/bin/
  install -Dm644 usr/share/wayland-sessions/${pkgname%-bin}.desktop        -t ${pkgdir}/usr/share/wayland-sessions/
  install -Dm644 usr/share/xdg-desktop-portal/${pkgname%-bin}-portals.conf -t ${pkgdir}/usr/share/xdg-desktop-portal/
  install -Dm644 usr/lib/systemd/user/${pkgname%-bin}.service              -t ${pkgdir}/usr/lib/systemd/user/
  install -Dm644 usr/lib/systemd/user/${pkgname%-bin}-shutdown.target      -t ${pkgdir}/usr/lib/systemd/user/
}
