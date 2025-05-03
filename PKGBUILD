# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=webscrapbook
pkgname=python-$_pkgname
pkgver=2.5.2
pkgrel=1
pkgdesc="PyWebScrapBook is a command line toolkit and backend server for WebScrapBook browser extension"
arch=('any')
url="https://github.com/danny0838/PyWebScrapBook"
license=('MIT')
depends=('python' 'python-commonmark' 'python-flask' 'python-lxml' 'python-pyopenssl' 'python-werkzeug' 'python-jinja')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('3621ebe00bdcb0b2bc184a8f480ca2cce596a0eaa500230882ea507f1cfdef05')

build() {
    cd "$srcdir/PyWebScrapBook-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/PyWebScrapBook-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
