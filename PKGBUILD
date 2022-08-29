# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cucumber-tag-expressions
pkgver=4.0.2
pkgrel=1
pkgdesc="Provides tag-expression parser for cucumber/behave"
url="https://github.com/cucumber/tag-expressions"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-html')
source=("https://github.com/cucumber/tag-expressions/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('41b03c83cec20caebb78c63e6a05b23bbaaa77ae98c34da7a80a0f59bfa2229eaeebe10212f44821cc9463bfd399ddcf637ec9b21e5cee8f01e604e16e532fd5')

build() {
  cd tag-expressions-$pkgver/python
  python setup.py build
}

check() {
  cd tag-expressions-$pkgver/python
  python -m pytest
}

package() {
  cd tag-expressions-$pkgver/python
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
