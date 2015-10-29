# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>
pkgbase=python-tinycss
pkgname=(python-tinycss python2-tinycss)
_pypi_name='tinycss'
pkgver=0.3
pkgrel=1
pkgdesc="A complete yet simple CSS parser for Python."
url="https://pypi.python.org/pypi/tinycss"
license=('BSD')
arch=('i686' 'x86_64')
makedepends=('python'  'python-setuptools'  'cython'
             'python2' 'python2-setuptools' 'cython2')
depends=('python')

source=("http://pypi.python.org/packages/source/t/tinycss/tinycss-$pkgver.tar.gz")
md5sums=('13999e54453d4fbc9d1539f4b95d235e')

prepare() {
  cd "$srcdir"
  cp -r $_pypi_name-$pkgver py2-$_pypi_name-$pkgver
}

package_python-tinycss() {
  depends=('python')
  cd "$srcdir/$_pypi_name-$pkgver"
  python3 setup.py install --root="$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-tinycss() {
  depends=('python2')
  cd "$srcdir/py2-$_pypi_name-$pkgver"
  python2 setup.py install --root="$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
