# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-xdoctest
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.15.0
pkgrel=1
pkgdesc="rewrite of doctest module (with pytest integration)"
arch=('any')
url="https://github.com/Erotemic/xdoctest"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('dec2bffde80f10a2a9eac8d3a35ba5a974c25b785e23e90aefe2bfc7b6227b91a58e6e99a927d4bff6792b93f7967844cab5fc7eb67a5d697dda68d1409fcbd6')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
