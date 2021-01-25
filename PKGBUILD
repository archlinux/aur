# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-xdoctest
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.15.2
pkgrel=1
pkgdesc="rewrite of doctest module (with pytest integration)"
arch=('any')
url="https://github.com/Erotemic/xdoctest"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('cc28e42e13c30c487d04952c6f55d7da5fb1b9f1005dc84f2bae699440f80d7ee0b494e262080556e8ad9ee7d575ce6b51e0e780ba5ef993f586e796a98ad00b')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
