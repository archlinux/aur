# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-flask-httpauth
_pyname=Flask-HTTPAuth
pkgver=3.2.2
pkgrel=1
pkgdesc="Simple extension that provides Basic and Digest HTTP authentication for Flask routes"
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-setuptools')
url="https://github.com/miguelgrinberg/Flask-HTTPAuth"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/6d/ce/f584f9f082bc952c1dc1fade158de721809d7591eee752bf4740c32dfe8c/Flask-HTTPAuth-3.2.2.tar.gz)
md5sums=('cd1e23098e54b644f367564b2c6208e8')
sha256sums=('df39b02a5ef71d4dc6c7ea43bd0ed84342eb8d66d50a7cd34d2ce13f5812440d')

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
