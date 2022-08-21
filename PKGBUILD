# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-icon-picker')
pkgver=0.0.1
pkgrel=2
pkgdesc="GTK icon chooser with textual search"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-icon-picker"
license=('MIT')
provides=('nwg-icon-picker')
conflicts=('nwg-icon-picker' 'nwg-icon-picker-git')
depends=('python' 'python-gobject' 'gtk3')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-icon-picker/archive/v"$pkgver".tar.gz")

md5sums=('7ed0b75ea5ad18ec1f69acf62e75e28c')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-icon-picker.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-icon-picker.desktop
}