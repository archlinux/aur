# Maintainer: Felix Höffken <fupduck at sacknagel dot com>

_srcname=leap.pixelated-www
pkgname=python2-$_srcname
pkgver=1.0.201709121424
pkgrel=1
pkgdesc='Static Assets for the Pixelated User Agent UI'
arch=('any')
url='http://github.com/leapcode/pixelated-user-agent'
license=('AGPL3')

source=("https://files.pythonhosted.org/packages/source/${_srcname::1}/${_srcname}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('142477d3fe31921af2bfbbec4c7fe9472edf8c15e5c5317f96631a6b66398f0f')

build() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
