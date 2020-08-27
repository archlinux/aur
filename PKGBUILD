# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-xdoctest
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.14.0
pkgrel=1
pkgdesc="rewrite of doctest module (with pytest integration)"
arch=('any')
url="https://github.com/Erotemic/xdoctest"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('c40e2156eabf29358c9440e0fe0955db2b306ca7fdb527c31f9539af2837de17004271818d8fcac97c6b34bbcc2a7db72c90217ed6c47d725fd9c62f8d90798b')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
