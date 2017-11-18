# Maintainer: Felix Höffken <fupduck at sacknagel dot com>

_srcname=leap.bitmask_js
pkgname=python2-$_srcname
pkgver=0.2.201709102115
pkgrel=1
pkgdesc='Bitmask UI'
arch=('any')
url='http://github.com/leapcode/bitmask-dev'

source=("https://files.pythonhosted.org/packages/source/${_srcname::1}/${_srcname}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('3b426eaefa58e18152067e00841b536b84d6bef22238c143f968becdcdd2bcb9')

build() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
