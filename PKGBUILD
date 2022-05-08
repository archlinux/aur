# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-shell-config')
pkgver=0.3.0
pkgrel=2
pkgdesc="nwg-shell configuration utility"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-shell-config"
license=('MIT')
depends=('python' 'python-gobject' 'python-i3ipc' 'python-geopy')
makedepends=('python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-shell-config/archive/v"$pkgver".tar.gz")

md5sums=('7879dd853445b92b604ead0db3cb634c')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-shell-config.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-shell-config.desktop
}
