# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

_buildnum=06966759
pkgname=niri-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="Scrollable-tiling Wayland compositor"
arch=(x86_64)
url="https://github.com/YaLTeR/${pkgname}"
license=(GPL-3.0-or-later)
depends=(cairo glib2 libinput libpipewire libxkbcommon mesa pango pixman seatd)
source=(https://download.copr.fedorainfracloud.org/results/yalter/${pkgname%-bin}/fedora-39-${CARCH}/${_buildnum}-${pkgname%-bin}/${pkgname%-bin}-${pkgver}-1.fc39.${CARCH}.rpm)
b2sums=('4357f135bd8c680eed7726130794b358642c8f124fc05970b892b2c97934a6d1908433f821bb52c310f897836aa1f07c550a96ca2f389878c8a7eb307262f23d')
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
install=${pkgname%-bin}.install

package() {
  install -Dm755 usr/bin/${pkgname%-bin}{,-session}                        -t ${pkgdir}/usr/bin/
  install -Dm644 usr/share/wayland-sessions/${pkgname%-bin}.desktop        -t ${pkgdir}/usr/share/wayland-sessions/
  install -Dm644 usr/share/xdg-desktop-portal/${pkgname%-bin}-portals.conf -t ${pkgdir}/usr/share/xdg-desktop-portal/
  install -Dm644 usr/lib/systemd/user/${pkgname%-bin}.service              -t ${pkgdir}/usr/lib/systemd/user/
  install -Dm644 usr/lib/systemd/user/${pkgname%-bin}-shutdown.target      -t ${pkgdir}/usr/lib/systemd/user/
  install -Dm644 usr/share/doc/${pkgname%-bin}/default-config.kdl          -t ${pkgdir}/usr/share/doc/${pkgname%-bin}
}
