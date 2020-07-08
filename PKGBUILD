# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-xdoctest
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.12.0
pkgrel=1
pkgdesc="rewrite of doctest module (with pytest integration)"
arch=('any')
url="https://github.com/Erotemic/xdoctest"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('0792fee90dccaf9b8dfba147d82d5798c22b70262ac8fcf068fd1a28358c0f1a76936b3636521cde22b44788b10efb9c993706010efc38f0c4aa3eff5fc0f707')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
