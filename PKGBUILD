# Maintainer: Adrien Peslerbe <adrien@pesler.be>
# Arch/Manjaro binary package for Veshell.
#
# Generated at release time by scripts/gen-bin-recipes.py from
# templates/PKGBUILD-bin.in. Do not edit by hand.
#
# This installs the prebuilt payload published on the GitHub release
# (veshell-<release>-x86_64.tar.zst). Prefer the source `veshell` package when
# you want a fully verifiable source build.

pkgname=veshell-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="An innovative Not-Desktop environment for Linux built with Flutter and Rust"
arch=('x86_64')
url="https://github.com/free-explorers/veshell"
license=('GPL-3.0-or-later')
depends=(
  'fontconfig' 'ttf-roboto' 'noto-fonts' 'noto-fonts-cjk'
  'libglvnd' 'mesa'
  'libinput' 'seatd' 'systemd-libs' 'libxkbcommon' 'libxkbcommon-x11'
  'libdisplay-info' 'wayland'
  'pipewire' 'libpulse'
  'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good'
  'dbus' 'upower' 'polkit'
  'xorg-xwayland' 'xdg-desktop-portal' 'xdg-utils'
)
optdepends=(
  'networkmanager: network control panel'
  'bluez: Bluetooth control panel'
  'rtkit: real-time audio scheduling'
  'xdg-desktop-portal-gtk: GTK portal fallback backend'
)
provides=('veshell' 'wayland-compositor')
conflicts=('veshell' 'veshell-git')

source=("veshell-0.1.0-x86_64.tar.zst::https://github.com/free-explorers/veshell-packaging/releases/download/v0.1.0/veshell-0.1.0-x86_64.tar.zst")
sha256sums=('615158b9e97943d9dd65abc7bd346bd32a892ff93a547ea4fea8e085ac742ccc')

package() {
  bsdtar -xf "$srcdir/veshell-0.1.0-x86_64.tar.zst" -C "$pkgdir"
  install -Dm644 "$pkgdir/usr/share/licenses/veshell/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
