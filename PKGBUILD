# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-flask-httpauth
_pyname=Flask-HTTPAuth
pkgver=3.2.1
pkgrel=1
pkgdesc="Simple extension that provides Basic and Digest HTTP authentication for Flask routes"
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-setuptools')
url="https://github.com/miguelgrinberg/Flask-HTTPAuth"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/89/8f/3bf5b37799d4a58703895b65f5f28aae171878b28cef634b1ed704fca75e/Flask-HTTPAuth-3.2.1.tar.gz)
md5sums=('c63047e2b6303a36e612da930f90656c')
sha256sums=('c807dab42064f3184689875ecc0abb23449fdc6862f7f5ba1b6a63508e43d6b5')

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
