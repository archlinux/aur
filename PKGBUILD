# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=nomadnet
pkgver=0.2.4
pkgrel=1
pkgdesc="Off-grid, resilient mesh communication with strong encryption"
arch=('any')
depends=('python-lxmf' 'python-urwid')
makedepends=('python-setuptools')
url="https://github.com/markqvist/nomadnet"
license=('MIT')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver-$pkgrel.tar.gz)
sha256sums=('4c44822ea86a62c69d07f155e59e4747b18b2cc9d49994e64e2cac733428bc07')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
