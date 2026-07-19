# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=webscrapbook
pkgname=python-$_pkgname
pkgver=2.9.1
pkgrel=2
pkgdesc="PyWebScrapBook is a command line toolkit and backend server for WebScrapBook browser extension"
arch=('any')
url="https://github.com/danny0838/PyWebScrapBook"
license=('MIT')
depends=('python' 'python-commonmark' 'python-flask' 'python-lxml' 'python-pyopenssl' 'python-werkzeug' 'python-jinja' 'python-zipremove')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('01faf72a9af78657b79178de3d7461a05fe168874b3d37c5492988192ccc9356')

build() {
    cd "$srcdir/PyWebScrapBook-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/PyWebScrapBook-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
