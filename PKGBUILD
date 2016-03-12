# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-flask-httpauth
_pyname=Flask-HTTPAuth
pkgver=3.0.2
pkgrel=1
pkgdesc="Simple extension that provides Basic and Digest HTTP authentication for Flask routes"
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-setuptools')
url="https://github.com/miguelgrinberg/Flask-HTTPAuth"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/F/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('46f892d4f3f44756e0f86aa04770de9e')
sha256sums=('61983e350206d4d4c266974a74a740053aa3ef2ccd6dc39235490efde4ca0921')

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
