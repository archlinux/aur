# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-black
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.2.1
pkgrel=1
pkgdesc="flake8 plugin to call black as a code style validator"
arch=('any')
url="https://github.com/peterjc/flake8-black"
license=('MIT')
depends=('flake8' 'python-black')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('46cf95349f683d3c4f411425c1e6e70dc0a0036036eccb736362b9888b4b0cb4c6d215fdb78bf59bbe8d9f3edca24959121c628426570dc1917f6ef9ad5ffbca')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.rst
}
