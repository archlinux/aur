# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-shell')
pkgver=0.0.3
pkgrel=1
pkgdesc="nwg-shell meta-package and installer"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-shell"
license=('MIT')
depends=('python' 'sway' 'grim' 'slurp' 'swayidle' 'swaylock' 'swappy' 'wl-clipboard' 'jq'
         'lxappearance' 'foot' 'wlsunset' 'wdisplays' 'swaync' 'python-geopy' 'python-dasbus'
         'azote' 'autotiling' 'nwg-panel' 'nwg-wrapper' 'nwg-bar' 'nwg-dock' 'nwg-drawer'
         'nwg-menu' 'gopsuinfo' 'nwg-shell-config' 'xorg-xwayland' 'pacman-contrib'
         'papirus-icon-theme')
optdepends=('xorg-xwayland: for X clients'
            'libappindicator-gtk3: for tray status icon')
makedepends=('python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-shell/archive/v"$pkgver".tar.gz")

md5sums=('SKIP')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/backgrounds nwg-shell.jpg
}
