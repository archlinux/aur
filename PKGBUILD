# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-clipman')
pkgver=0.1.0
pkgrel=1
pkgdesc="nwg-shell clipboard manager, a GTK3-based GUI for cliphist"
arch=('any')
url="https://github.com/nwg-piotr/nwg-clipman"
license=('MIT')
provides=('nwg-clipman')
depends=('python' 'python-gobject' 'gtk3' 'gtk-layer-shell' 'cliphist' 'xdg-utils')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-clipman/archive/v"$pkgver".tar.gz")

md5sums=('0b1b4c811a354c9240d5fc075756ee18')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-clipman.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-clipman.desktop
}
