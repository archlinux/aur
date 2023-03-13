# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-icon-picker')
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK icon picker with textual search"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-icon-picker"
license=('MIT')
provides=('nwg-icon-picker')
conflicts=('nwg-icon-picker' 'nwg-icon-picker-git')
depends=('python' 'python-gobject' 'gtk3')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-icon-picker/archive/v"$pkgver".tar.gz")

md5sums=('b219c223ef52affcbbfa653615e9b627')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-icon-picker.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-icon-picker.desktop
}