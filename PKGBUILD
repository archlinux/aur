# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=pyroaring
pkgname=python-$_name
pkgver=0.3.0
pkgrel=1
pkgdesc="Fast and lightweight set for unsigned 32 bits integers"
arch=('x86_64')
url="https://pypi.org/pypi/$_name"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('685b6beb5eecf25cc66bcfe45926cb38a18722a294079a4e90c62e2c80a10408')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
