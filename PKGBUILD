# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-panel')
pkgver=0.9.21
pkgrel=1
pkgdesc="GTK3-based panel for sway and Hyprland Wayland compositors"
arch=('any')
url="https://github.com/nwg-piotr/nwg-panel"
license=('MIT')
depends=('python' 'python-gobject' 'python-i3ipc' 'python-cairo' 'python-dasbus' 'python-netifaces' 'python-psutil' 'python-requests' 'bluez-utils' 'gtk3' 'libappindicator-gtk3' 'gtk-layer-shell' 'brightnessctl' 'playerctl' 'nwg-icon-picker')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('wlr-randr: for non-sway Wayland WMs support'
            'swaync: for Sway Notification Center support'
            'ddcutil: for external displays brightness control'
            'upower: for multiple batteries support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-panel/archive/v"$pkgver".tar.gz")

md5sums=('5553a6429c38e03f5b81ccf4a2e1b4ea')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-panel.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-shell.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-processes.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-panel-config.desktop
  install -D -t "$pkgdir"/usr/share/applications nwg-processes.desktop
}
