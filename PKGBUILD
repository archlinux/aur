# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-flask-httpauth
_pyname=Flask-HTTPAuth
pkgver=3.2.0
pkgrel=1
pkgdesc="Simple extension that provides Basic and Digest HTTP authentication for Flask routes"
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-setuptools')
url="https://github.com/miguelgrinberg/Flask-HTTPAuth"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/3b/39/51ed0f2207f875ad5913f4bd3dcfe306fb1365460d97ff3079bb94edf964/Flask-HTTPAuth-3.2.0.tar.gz)
md5sums=('c3c80d4223218fb008533d147487b222')
sha256sums=('cf53acd441321ff6f369ae54e423dbec8d4c6204934c13368651cdd402805b61')

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
