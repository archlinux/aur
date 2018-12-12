# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Dominik Pieczyński <dominik.pieczynski@gmail.com>

_pkgname=picamera
pkgname=python-${_pkgname}
pkgver=1.13
pkgrel=2
pkgdesc="pure Python interface to the Raspberry Pi camera module"
arch=('any')
url="https://pypi.python.org/pypi/picamera/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
optdepends=("python-numpy: used by array")
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('890815aa01e4d855a6a95dd3ad0953b872a6b954982106407df0c5a31a163e50')

build() {
  cd "picamera-$pkgver"
  python setup.py build
}

package() {
  cd "picamera-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
