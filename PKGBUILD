pkgname=hyprism-shell
pkgver=0.1.5
pkgrel=1
pkgdesc='Hyprland and Quickshell desktop environment with dynamic theming'
arch=('any')
url='https://github.com/kristyancarvalho/hyprism'
license=('MIT')
depends=(
  'awww'
  'bluez-utils'
  'brightnessctl'
  'cliphist'
  'git'
  'gnome-themes-extra'
  'grim'
  'hyprland'
  'hyprlock'
  'hyprpicker'
  'hyprpolkitagent'
  'jq'
  'kitty'
  'kvantum'
  'matugen'
  'networkmanager'
  'noto-fonts-emoji'
  'papirus-icon-theme'
  'playerctl'
  'power-profiles-daemon'
  'python'
  'python-pillow'
  'qt5ct'
  'qt6-imageformats'
  'qt6ct'
  'quickshell'
  'sassc'
  'slurp'
  'thunar'
  'ttf-jetbrains-mono-nerd'
  'ttf-nerd-fonts-symbols-mono'
  'upower'
  'wireplumber'
  'wl-clipboard'
)
optdepends=(
  'chromium: default web application keybindings'
  'curl: Google Sans Flex user installer'
  'ddcutil: external monitor brightness control'
  'fastfetch: themed system information preset'
  'flatpak: Flatpak application integration'
  'foot: alternative themed terminal'
  'hyprsunset: night color mode'
  'imagemagick: generated Fastfetch logo'
  'neovim: generated NvChad palette'
  'pacman-contrib: non-blocking update checks'
  'qt6-virtualkeyboard: SDDM virtual keyboard'
  'sddm: Hyprism login theme'
  'snapper: snapshot status widget'
  'starship: generated shell prompt theme'
  'tmux: generated terminal multiplexer theme'
  'wf-recorder: screen recording'
  'xdg-desktop-portal-gtk: GTK desktop portal backend'
  'xdg-desktop-portal-hyprland: Hyprland desktop portal backend'
  'xdg-utils: default application integration'
  'zathura: generated document viewer theme'
  'zathura-pdf-mupdf: PDF support for Zathura'
)
source=("hyprism-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b879eccc8b59cf6077c04a6079461644e5732c2dfe8d748401e4068760d2fc4c')

package() {
  cd "hyprism-${pkgver}"
  make install-system PREFIX=/usr DESTDIR="$pkgdir" PACKAGE_NAME="$pkgname"
}
