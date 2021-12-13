# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pytest-deadfixtures
_pkgname="${pkgname#python-}"
pkgver=2.2.1
pkgrel=2
pkgdesc="Pytest plugin to list unused fixtures in tests"
arch=('any')
url="https://github.com/jllorencetti/pytest-deadfixtures"
license=('MIT')
depends=('python' 'python-pytest')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('f4bf0495c3136e0b1af37c9a6c2e459bf924a8eee8650c9bca48c0b6112ff82d8454dc1d1ca4f7364e030fe7c9157b249b5f64bf2307a44477341dd29fad9b6c')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
