pkgname=python-wyoming
_pkgname=wyoming
pkgdesc="Protocol for Rhasspy Voice Assistant"
pkgver=0.0.1
pkgrel=1
arch=(any)
url="http://github.com/rhasspy/rhasspy3"
license=('MIT')
depends=(python)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/w/wyoming/wyoming-$pkgver.tar.gz")
sha256sums=('10851b28bf0334534d1a62d172ed769a5c381fe8001e6094c34f5e2c6d2cf3e3')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
