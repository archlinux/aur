# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=pyg3t
pkgver=0.5.0
pkgrel=2
pkgdesc="Python gettext Translation Toolkit"
arch=(any)
url="https://github.com/pyg3t/pyg3t"
license=('GPL3')
depends=('python')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('45bcdd4c8ee01491cc66f3e42c632245e9572e7fd1f2ae184fa1839db3e809ba')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  py.test -vv .
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
