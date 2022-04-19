# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
_name=pytest-datafiles
pkgname=python-pytest-datafiles
pkgver=2.0
pkgrel=3
pkgdesc="py.test plugin to create a 'tmpdir' containing predefined files/directories."
arch=(any)
url="https://github.com/omarkohl/pytest-datafiles"
license=('MIT')
depends=(python-pytest)
makedepends=(python-setuptools)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('143329cbb1dbbb07af24f88fa4668e2f59ce233696cf12c49fd1c98d1756dbf9')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
