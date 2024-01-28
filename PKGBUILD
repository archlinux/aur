# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('autotiling')
pkgver=1.8
pkgrel=4
pkgdesc="Script for sway and i3 to automatically switch the horizontal / vertical window split orientation"
arch=('x86_64')
url="https://github.com/nwg-piotr/autotiling"
license=('GPL3')
provides=('autotiling')
depends=('python-i3ipc')
makedepends=('python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/autotiling/archive/v$pkgver.tar.gz")

md5sums=('fda98daaf96517e598b0c1d5f993974f')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  
  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
  install -D -t "$pkgdir"/usr/share/doc/"$pkgname" README.md
}
