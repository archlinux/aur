# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
_name=pytest-datafiles
pkgname=python-pytest-datafiles
pkgver=2.0.1
pkgrel=1
pkgdesc="py.test plugin to create a 'tmpdir' containing predefined files/directories."
arch=(any)
url="https://github.com/omarkohl/pytest-datafiles"
license=('MIT')
depends=(python-pytest)
makedepends=(python-setuptools)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6f6558d2a6e7cbde714f62411ce84e5c02ccd195bd7a50263bfdd888be4a1544')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
