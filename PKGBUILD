# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-shell')
pkgver=0.5.31
pkgrel=1
pkgdesc="nwg-shell meta-package"
arch=('any')
url="https://github.com/nwg-piotr/nwg-shell"
license=('MIT')
depends=('foot' 'gnome-themes-extra' 'grim' 'imagemagick' 'jq'
         'libappindicator-gtk3' 'ttf-dejavu' 'network-manager-applet' 
         'pacman-contrib' 'papirus-icon-theme' 'playerctl' 'polkit-gnome' 
         'python-geopy' 'python-yaml' 'slurp' 'swappy' 'sway' 'swayidle'
         'swaylock' 'swaybg' 'wl-clipboard' 'xorg-xwayland' 'wlsunset' 
         'azote' 'gopsuinfo' 'nwg-bar-bin' 'nwg-dock-bin' 'nwg-dock-hyprland-bin' 
         'nwg-drawer-bin' 'nwg-menu-bin' 'nwg-look' 'nwg-panel' 'nwg-shell-config' 
         'nwg-shell-wallpapers' 'nwg-displays' 'nwg-clipman' 'nwg-readme-browser' 
         'python-dasbus' 'swaync' 'gtklock' 'gtklock-userinfo-module' 
         'gtklock-powerbar-module' 'gtklock-playerctl-module')
optdepends=('chromium: suggested web browser' 
            'mousepad: suggested text editor' 
            'thunar: suggested file manager'
            'nano: in case you hate vi')
makedepends=('python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-shell/releases/download/v"$pkgver"/nwg-shell-v"$pkgver".tar.gz")

md5sums=('130d2e6a276c4ecb4d6440ada5b412e8')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/local/bin scripts/*
  install -D -t "$pkgdir"/usr/share/backgrounds nwg-shell.jpg
  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
  install -D -t "$pkgdir"/usr/share/doc/"$pkgname" README.md
  install -D -t "$pkgdir"/usr/share/applications nwg-readme.desktop
}
