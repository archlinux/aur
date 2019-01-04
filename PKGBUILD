pkgbase=python-ostruct
_pyname=${pkgbase##python-}
pkgname=(python-ostruct python2-ostruct)
makedepends=(python python2 python-setuptools python2-setuptools)
pkgver=3.0.1
pkgrel=1
pkgdesc='OpenStruct for Python'
arch=(any)
url=https://github.com/hamidnazari/python-ostruct
license=(MIT)
source=(https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha512sums=('f00772d8a35b88703147502add274e0413358ec4b217e1898c048c549922fd397e6ac37d48a15f1dfc0001e8b171ac5df55625a31f9f8092fc6ea1b2579b4b05')

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py build
  python2 setup.py build
}

package_python-ostruct() {
  depends=(python)
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
}

package_python2-ostruct() {
  depends=(python2)
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
}
