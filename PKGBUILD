# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-flask-httpauth
_pyname=Flask-HTTPAuth
pkgver=2.6.0
pkgrel=1
pkgdesc="Simple extension that provides Basic and Digest HTTP authentication for Flask routes"
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-setuptools')
url="https://github.com/miguelgrinberg/Flask-HTTPAuth"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/F/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('e5d6e5d56c311482d7f1aee3875ceed8')
sha256sums=('c82214a9f49f7bf0f7f78c780a243b38c2557a9bb81f9fd261775fc017fb897c')

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
