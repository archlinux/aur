# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-shell')
pkgver=0.0.3
pkgrel=3
pkgdesc="nwg-shell meta-package and installer"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-shell"
license=('MIT')
depends=('base-devel' 'foot' 'git' 'gnome-themes-extra' 'grim' 'jq' 'libappindicator-gtk3' 
         'light' 'lxappearance' 'man-db' 'noto-fonts' 'pacman-contrib' 'papirus-icon-theme'
         'playerctl' 'polkit-gnome' 'python-geopy' 'slurp' 'swappy' 'sway' 'swayidle' 'swaylock' 
         'vi' 'wl-clipboard' 'xorg-xwayland' 
         'autotiling' 'azote' 'gopsuinfo' 'nwg-bar-bin' 'nwg-dock-bin' 'nwg-drawer-bin' 'nwg-menu'
         'nwg-panel' 'nwg-shell-config' 'nwg-wrapper' 'python-dasbus' 'swaync' 'wdisplays' 'wlsunset')
optdepends=('chromium: suggested web browser' 
            'mousepad: suggested text editor' 
            'thunar: suggested file manager'
            'nano: in case you hate vi')
makedepends=('python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-shell/archive/v"$pkgver".tar.gz")

md5sums=('SKIP')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/backgrounds nwg-shell.jpg
}
