# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cucumber-tag-expressions
pkgver=4.1.0
pkgrel=2
pkgdesc="Provides tag-expression parser for cucumber/behave"
url="https://github.com/cucumber/tag-expressions"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-html')
source=("https://github.com/cucumber/tag-expressions/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b4790d8057d486b3d222ceea0e1e40c2e7a59f7d64e52f29f5e72ac4d91bdce8ac1c5b1aeced685e2d03046bc5c94e2fcb84a6c15f0f21560e85522c9dbae489')

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
