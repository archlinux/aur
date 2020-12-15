# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cucumber-tag-expressions
pkgver=3.0.0
pkgrel=1
pkgdesc="Provides tag-expression parser for cucumber/behave"
url="https://github.com/cucumber/tag-expressions-python"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-html')
source=("https://github.com/cucumber/tag-expressions-python/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a24ed1b1ae6900a87a3e1660d321d92967b599b34cad9634cd5831ca3327187c9a28cfdc6be4547db436c244af8a39c89ef68739774148451b55f9837a2e8c52')

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
