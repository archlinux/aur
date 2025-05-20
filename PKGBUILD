# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=webscrapbook
pkgname=python-$_pkgname
pkgver=2.6.0
pkgrel=1
pkgdesc="PyWebScrapBook is a command line toolkit and backend server for WebScrapBook browser extension"
arch=('any')
url="https://github.com/danny0838/PyWebScrapBook"
license=('MIT')
depends=('python' 'python-commonmark' 'python-flask' 'python-lxml' 'python-pyopenssl' 'python-werkzeug' 'python-jinja')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('c710e62422a60d272ee7f7f9aaba25525a8bf97935fa417d3e42f0ec4db011a2')

build() {
    cd "$srcdir/PyWebScrapBook-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/PyWebScrapBook-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
