# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=python2-py
_name=${pkgname#python2-}
pkgver=1.11.0
pkgrel=2
pkgdesc='I/O facilities including logging, local/SVN paths, INI parsing, '`
       `'API control, lazy importing and Python code generation/introspection'
arch=('any')
_pypi='https://pypi.python.org'
url="$_pypi/pypi/$_name"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools-scm')
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
