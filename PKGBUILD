# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-displays')
pkgver=0.3.3
pkgrel=1
pkgdesc="Output management utility for sway and Hyprland Wayland compositors"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-displays"
license=('MIT')
provides=('nwg-displays')
conflicts=('nwg-displays' 'nwg-displays-git')
depends=('python' 'python-gobject' 'gtk3' 'gtk-layer-shell' 'python-i3ipc')
optdepends=('wlr-randr: for Hyprland support')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-displays/archive/v"$pkgver".tar.gz")

md5sums=('b838305eb0678b8651219dd2cff49a24')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-displays.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-displays.desktop
}