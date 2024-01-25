# Maintainer: LeonMW 

pkgname=leonmw-hyperland-dot
pkgver=0.2
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/leonlolly/${pkgname}.git"
license=('MIT')
groups=()
depends=('hyprland' 'hyprpicker' 'waybar' 'wlogout' 'wlsunset' 'xdg-desktop-portal-hyprland' 'xwaylandvideobridge' 
    'cliphist' 'rofi-lbonn-wayland-git' 
    'rofi-emoji' 
    'starship' 'zsh' 
    'catppuccin-gtk-theme-macchiato' 'catppuccin-gtk-theme-mocha' 'papirus-icon-theme' 
    'pipewire' 'pipewire-alsa' 'pipewire-audio' 'pipewire-pulse' 'pipewire-jack' 'wireplumber' 'gst-plugin-pipewire'
)
#makedepends=('')
install="${pkgname}.install"
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://github.com/leonlolly/${pkgname}/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('f86b3b62d2ce07278ff980102dee747bf4e01facf50f99446c4aef56ca326b2fc2e7d74265231eb234435b6bc9b7d0a94267326d4b15a0c7b8ab03d8d987619c')


package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/themes/${pkgname}"
  cp -R .* ${pkgdir}/usr/share/themes/${pkgname}
  
  install -Dm755 install.sh "${pkgdir}/usr/share/themes/${pkgname}/install.sh"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

