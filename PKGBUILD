# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cucumber-tag-expressions
pkgver=3.0.1
pkgrel=3
pkgdesc="Provides tag-expression parser for cucumber/behave"
url="https://github.com/cucumber/tag-expressions-python"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-html')
source=("https://github.com/cucumber/tag-expressions-python/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('444c04d219998899e7ea30f3a3141c9f6d711c7ab727eca107bdcfa0b3b8fe66c99cfa07c695638efcbf5279d75a12434101a85f2c778f6802a74a972b274c85')

build() {
  cd tag-expressions-python-$pkgver
  python setup.py build
}

check() {
  cd tag-expressions-python-$pkgver
  python -m pytest
}

package() {
  cd tag-expressions-python-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
