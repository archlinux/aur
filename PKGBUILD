# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgname=python-openskill
pkgver=6.1.3
pkgrel=1
pkgdesc="multiplayer rating system"
arch=('any')
url="https://openskill.me"
license=('MIT')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vivekjoshy/openskill.py/archive/v$pkgver.tar.gz")
sha256sums=('4248288d5a022d6f1d67d88eefdf26ebd4624fcf3102159a020ef64ff23622ba')

build() {
  cd "openskill.py-$pkgver"
  python setup.py build
}

package() {
  cd "openskill.py-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
