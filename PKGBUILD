# Maintainer: Felix Höffken <fupduck at sacknagel dot com>

_srcname=leap.bitmask_js
pkgname=python2-$_srcname
pkgver=0.3.201801261450
pkgrel=1
pkgdesc='Bitmask UI'
arch=('any')
url='http://github.com/leapcode/bitmask-dev'

source=("https://files.pythonhosted.org/packages/source/${_srcname::1}/${_srcname}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('a5d06cad736fd0bfb07ed771354b325ca11d43032c763905902925c36333d34e')

build() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
