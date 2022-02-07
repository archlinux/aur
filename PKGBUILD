# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>

pkgbase=python2-lzo
pkgname=(python-lzo python2-lzo)
pkgver=1.14
pkgrel=1
pkgdesc="Python bindings for the LZO data compression library"
arch=('x86_64')
url="https://pypi.python.org/pypi/python-lzo"
license=('GPL2')
makedepends=()
source=("https://pypi.org/packages/source/p/python-lzo/python-lzo-$pkgver.tar.gz")
sha256sums=('83cbd8ecaae284735250e31d6c0ecc18ac08763fab2a8c910dc5a6910db6250c')

prepare() {
  cp -a python-lzo-$pkgver python2-lzo-$pkgver
}

build() {
  cd "$srcdir/python-lzo-$pkgver"
  python setup.py build

  cd "$srcdir/python2-lzo-$pkgver"
  python2 setup.py build
}

package_python-lzo() {
  cd "$srcdir/python-lzo-$pkgver"
  python setup.py install --skip-build --optimize=1 --root "$pkgdir"
}

package_python2-lzo() {
  cd "$srcdir/python2-lzo-$pkgver"
  python2 setup.py install --skip-build --optimize=1 --root "$pkgdir"
}
