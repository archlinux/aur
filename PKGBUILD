# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
_name=pytest-datafiles
pkgname=python-pytest-datafiles
pkgver=3.0.0
pkgrel=1
pkgdesc="py.test plugin to create a 'tmpdir' containing predefined files/directories."
arch=(any)
url="https://github.com/omarkohl/pytest-datafiles"
license=('MIT')
depends=(python-pytest)
makedepends=(python-setuptools)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a70c4c66a36d1cdcfc095607f04eee66eaef3fa64cbb62d60c47ce169901d1d4')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
