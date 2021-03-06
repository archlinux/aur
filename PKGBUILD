# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-panel')
pkgver=0.1.7
pkgrel=1
pkgdesc="GTK3-based panel for sway window manager"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-panel"
license=('MIT')
depends=('python' 'python-gobject' 'python-i3ipc' 'python-netifaces' 'python-psutil' 'gtk3' 'gtk-layer-shell' 'light' 'pamixer' 'playerctl')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('bluez: for Bluetooth status'
            'bluez-utils: for Bluetooth status'
            'pulseaudio: for audio output switcher'
            'wlr-randr: for non-sway window managers support')
source=("https://github.com/nwg-piotr/nwg-panel/archive/v"$pkgver".tar.gz")

md5sums=('14b26a73d24c0c50d6e04c46c1e09596')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-panel.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-panel-config.desktop
}
