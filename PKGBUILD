# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-flask-httpauth
_pyname=Flask-HTTPAuth
pkgver=3.1.2
pkgrel=1
pkgdesc="Simple extension that provides Basic and Digest HTTP authentication for Flask routes"
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-setuptools')
url="https://github.com/miguelgrinberg/Flask-HTTPAuth"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/fc/f8/2c06d94c9181affe2c31d5d53794358160240bcfe918446c1425f37663eb/$_pyname-$pkgver.tar.gz)
md5sums=('2a29a2613cbc391b96b8cfa8cd97a81f')
sha256sums=('e54fc11a6ca872ff0784d9bb56461b32b6d82e3d568dfacc0a1d1a21023d1af6')

build() {
  cd "$srcdir/$_pyname-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/$_pyname-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
