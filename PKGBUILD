pkgname=python-wyoming
_pkgname=wyoming
pkgdesc="Protocol for Rhasspy Voice Assistant"
pkgver=1.1.0
pkgrel=1
arch=(any)
url="http://github.com/rhasspy/rhasspy3"
license=('MIT')
depends=(python)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/w/wyoming/wyoming-$pkgver.tar.gz")
sha256sums=('2391a00eef47463e9f217ebaab746e0de075de1e9da70c6b481c4a87313e16eb')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
