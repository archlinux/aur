# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-xdoctest
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.13.0
pkgrel=1
pkgdesc="rewrite of doctest module (with pytest integration)"
arch=('any')
url="https://github.com/Erotemic/xdoctest"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('c110cbaeac38846f457b0221e57e21d1e26d3be38fd6e53d8239521fc15f04b44c7b319d93a07e85be1d2f173ad757314194e3bfd1db8755aa2f7b0e4edf9ccd')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
