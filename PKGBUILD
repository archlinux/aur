# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-displays')
pkgver=0.3.2
pkgrel=1
pkgdesc="Output management utility for sway Wayland compositor"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-displays"
license=('MIT')
provides=('nwg-displays')
conflicts=('nwg-displays' 'nwg-displays-git')
depends=('python' 'python-gobject' 'gtk3' 'gtk-layer-shell' 'python-i3ipc')
optdepends=('wlr-randr: for Hyprland support')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-displays/archive/v"$pkgver".tar.gz")

md5sums=('33d9b3ba9763730a7e4a4818c21eb7a4')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-displays.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-displays.desktop
}