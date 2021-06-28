# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-xdoctest
_pkgname="${pkgname#python-}"
pkgver=0.15.5
pkgrel=1
pkgdesc="A rewrite of Python's doctest module"
arch=('any')
url="https://github.com/Erotemic/xdoctest"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('632ab549953a170ac469d35c6cc43ed80cbc211ac0afbe3d181397a994d7f909d338b376d315b8abbe21d84a316135ced2046eba34550963f1dbcac35fdd1317')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
