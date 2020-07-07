# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-black
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.2.0
pkgrel=1
pkgdesc="flake8 plugin to call black as a code style validator"
arch=('any')
url="https://github.com/peterjc/flake8-black"
license=('MIT')
depends=('flake8' 'python-black')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('b2d561f3a5647ce4b770321ef236b9a243ad780130fa1bb12c03fead193e22d37b1ed7e146d1ca13caed27233e423f1525ddd0d662085da7f25f0afdf89a3b5e')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.rst
}
