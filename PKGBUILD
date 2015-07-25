# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-profilehooks
pkgver=1.8.0
pkgrel=1
pkgdesc='Decorators for profiling/timing/tracing individual functions'
arch=('any')
url='http://pypi.python.org/pypi/profilehooks/'
license=('MIT')
depends=('python')
source=("http://pypi.python.org/packages/source/p/profilehooks/profilehooks-$pkgver.tar.gz")
md5sums=('7887e07df4fb244a950debf841754762')

build() {
  cd "$srcdir/profilehooks-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/profilehooks-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  python -c 'from profilehooks import __doc__; print(__doc__[__doc__.find("Copyright"):])' > LICENSE
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

