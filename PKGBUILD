# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-panel')
pkgver=0.8.1
pkgrel=1
pkgdesc="GTK3-based panel for sway Wayland compositor"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-panel"
license=('MIT')
provides=('nwg-panel')
conflicts=('nwg-panel' 'nwg-panel-git')
depends=('python' 'python-gobject' 'python-i3ipc' 'python-dasbus' 'python-netifaces' 'python-psutil' 'python-requests' 'bluez-utils' 'gtk3' 'gtk-layer-shell' 'light' 'pamixer' 'playerctl' 'nwg-icon-picker')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('wlr-randr: for non-sway Wayland WMs support'
            'swaync: for Sway Notification Center support'
            'ddcutil: for external displays brightness control')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-panel/archive/v"$pkgver".tar.gz")

md5sums=('5e976c27e53799f4292367dea598fb99')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-panel.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-shell.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-processes.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-panel-config.desktop
  install -D -t "$pkgdir"/usr/share/applications nwg-processes.desktop
}
