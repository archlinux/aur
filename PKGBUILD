# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=webscrapbook
pkgname=python-$_pkgname
pkgver=2.9.0
pkgrel=1
pkgdesc="PyWebScrapBook is a command line toolkit and backend server for WebScrapBook browser extension"
arch=('any')
url="https://github.com/danny0838/PyWebScrapBook"
license=('MIT')
depends=('python' 'python-commonmark' 'python-flask' 'python-lxml' 'python-pyopenssl' 'python-werkzeug' 'python-jinja')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('6e21f3455eb864eb3c3f41f26c1bce1c9b52d5c0e68c5cc493ea5232150a5ae4')

build() {
    cd "$srcdir/PyWebScrapBook-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/PyWebScrapBook-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
