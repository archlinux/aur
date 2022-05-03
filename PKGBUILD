pkgname=pypy3-gast
pkgver=0.5.3
pkgrel=1
pkgdesc="AST that abstracts the underlying Python version "
url="https://github.com/serge-sans-paille/gast"
arch=(any)
license=('BSD')
depends=('pypy3')
makedepends=('pypy3-setuptools')
source=("https://pypi.io/packages/source/g/gast/gast-${pkgver}.tar.gz")
sha512sums=('a836be76303591ca7c40596d98a29dbd53f281e277c8c23e3821b2003d4e8aaf4d806e7f532f27c0eadd4bdca5a28dc0a3902245505ab97497b9afbfee0c2e52')

build() {
  cd gast-$pkgver
  pypy3 setup.py build
}

package() {
  cd gast-$pkgver
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
