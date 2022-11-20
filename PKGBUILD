# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>

pkgname=python3.8-cssselect
pkgver=1.2.0
pkgrel=1
license=('BSD')
arch=('any')
url="https://pypi.python.org/pypi/cssselect"
pkgdesc="A Python3 library that parses CSS3 Selectors and translates them to XPath 1.0"
depends=('python3.8')
makedepends=('python3.8-setuptools')
checkdepends=('python3.8-pytest' 'python3.8-lxml' 'python3.8-sybil')
source=("https://github.com/scrapy/cssselect/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('439f83e37c381f962abcfca0b83050372cbad44179e876591d8504abc2da1d4fe80891c8c8e1763341cf152525259565dc5e80038fa7c14e8c69f22a11f83d94')

build() {
  cd cssselect-$pkgver
  python3..8 setup.py build
}

check() {
  cd cssselect-$pkgver
  pytest
}

package() {
  cd cssselect-$pkgver
  python3..8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
