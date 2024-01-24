# Maintainer: LeonMW 

pkgname=leonmw-hyperland-dot
pkgver=0.2
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/leonlolly/HyperlandBeautyPackage.git"
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
source=($pkgname-$pkgver.tar.gz::https://github.com/leonlolly/HyperlandBeautyPackage/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('8d1ebc9a091febf393b5b5714b0f68ca1d21940018b8ce88fa7a6e78ad036a69c865d089faa2fdba71a70c8c45af455b3ff6a21877aad2d4e51d76651bb480c4')


package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/themes/${pkgname}"
  cp -R .* ${pkgdir}/usr/share/themes/${pkgname}
  
  install -Dm644 install.sh "${pkgdir}/usr/share/themes/${pkgname}/install.sh"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

