pkgname=python-wyoming
_pkgname=wyoming
pkgdesc="Protocol for Rhasspy Voice Assistant"
pkgver=1.2.0
pkgrel=1
arch=(any)
url="http://github.com/rhasspy/rhasspy3"
license=('MIT')
depends=(python)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/w/wyoming/wyoming-$pkgver.tar.gz")
sha256sums=('9a036173c3cc46bc1fbc664472022f43f3f6772b1d0e8da3baf65c72f6f60bf8')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
