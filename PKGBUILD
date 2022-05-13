# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-displays')
pkgver=0.1.3
pkgrel=1
pkgdesc="Output management utility for sway Wayland compositor"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-displays"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3' 'gtk-layer-shell' 'python-i3ipc')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-displays/archive/v"$pkgver".tar.gz")

md5sums=('1fef4ecfc00b40c0daa3cef63b16ffc9')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-displays.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-displays.desktop
}