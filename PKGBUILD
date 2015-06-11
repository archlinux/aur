# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-pympler
pkgver=0.4
pkgrel=1
pkgdesc='Measure, monitor and analyze the memory behavior of Python objects'
arch=('any')
url='http://pypi.python.org/pypi/pympler/'
license=('Apache')
depends=('python')
source=("http://pypi.python.org/packages/source/P/Pympler/Pympler-$pkgver.tar.gz")
md5sums=('68e4a8aa4a268996fa6a321b664918af')

build() {
  cd "$srcdir/Pympler-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/Pympler-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

