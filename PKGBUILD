# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=webscrapbook
pkgname=python-$_pkgname
pkgver=2.10.0
pkgrel=1
pkgdesc="PyWebScrapBook is a command line toolkit and backend server for WebScrapBook browser extension"
arch=('any')
url="https://github.com/danny0838/PyWebScrapBook"
license=('MIT')
depends=('python' 'python-commonmark' 'python-flask' 'python-lxml' 'python-pyopenssl' 'python-werkzeug' 'python-jinja' 'python-zipremove')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('22840577bd83c89b23f3056f2c31707cb9bf969296eb13570bec6185d2803d17')

build() {
    cd "$srcdir/PyWebScrapBook-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/PyWebScrapBook-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
