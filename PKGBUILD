# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-flask-httpauth
_pyname=Flask-HTTPAuth
pkgver=3.2.3
pkgrel=1
pkgdesc="Simple extension that provides Basic and Digest HTTP authentication for Flask routes"
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-setuptools')
url="https://github.com/miguelgrinberg/Flask-HTTPAuth"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/6f/73/2a8da636f18ed580507a34483cb4fe26ef8d466909972029ebb3605415d2/Flask-HTTPAuth-3.2.3.tar.gz)
md5sums=('20f31ed9eb28ca04de57bece707c63d7')
sha256sums=('5f4ba7ab79103e28b566c6a0592076312d17c716e079c66ca9ffe21a7871ee8d')

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
