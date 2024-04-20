# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=niri-bin
pkgver=0.1.5
pkgrel=1
_buildid=07330520
pkgdesc="Scrollable-tiling Wayland compositor"
arch=(aarch64 x86_64)
url="https://github.com/YaLTeR/${pkgname%-bin}"
_buildurl="https://download.copr.fedorainfracloud.org/results/yalter"
license=(GPL-3.0-or-later)
depends=(cairo gcc-libs glib2 glibc libinput libpipewire libxkbcommon mesa pango pixman seatd systemd-libs xdg-desktop-portal-gtk)
optdepends=('fuzzel: application launcher similar to rofi drun mode'
            'waybar: highly customizable Wayland bar'
            'alacritty: a cross-platform OpenGL terminal emulator'
            'mako: notification daemon for Wayland'
            'swaybg: wallpaper tool for Wayland compositors'
            'swaylock: screen locker for Wayland'
            'xdg-desktop-portal-gnome: screencasting support'
            'gnome-keyring: implements the secret portal, for certain apps to work'
            'polkit-gnome: when apps need to ask for root permissions')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source_aarch64=(${pkgname%-bin}-$pkgver-aarch64.rpm::$_buildurl/${pkgname%-bin}/fedora-40-aarch64/$_buildid-${pkgname%-bin}/${pkgname%-bin}-$pkgver-$pkgrel.fc40.aarch64.rpm)
source_x86_64=(${pkgname%-bin}-$pkgver-x86_64.rpm::$_buildurl/${pkgname%-bin}/fedora-40-x86_64/$_buildid-${pkgname%-bin}/${pkgname%-bin}-$pkgver-$pkgrel.fc40.x86_64.rpm)
b2sums_aarch64=('59a7b49c502a6e69548ef61185ddca3abe56f854efe3196394e7cae9afaa483f0c8527880d6811d1837a27dc9a2d05abe71f9d724215ad8012f43f8d3c6acd14')
b2sums_x86_64=('b657821b91c933c2906c05927ab701d24a02b9aa4b43ecdc41cc5e37b55a13a01d1f2821da641672cd4128dd537b0b8e998ee7865aba0fd81a6bde74fb4a391a')

package() {
    install -Dm755 usr/bin/${pkgname%-bin}{,-session}                              -t "$pkgdir"/usr/bin/
    install -Dm644 usr/lib/systemd/user/${pkgname%-bin}{.service,-shutdown.target} -t "$pkgdir"/usr/lib/systemd/user/
    install -Dm644 usr/share/doc/${pkgname%-bin}/{default-config.kdl,README.md}    -t "$pkgdir"/usr/share/doc/${pkgname%-bin}/
    install -Dm644 usr/share/wayland-sessions/${pkgname%-bin}.desktop              -t "$pkgdir"/usr/share/wayland-sessions/
    install -Dm644 usr/share/xdg-desktop-portal/${pkgname%-bin}-portals.conf       -t "$pkgdir"/usr/share/xdg-desktop-portal/
}
