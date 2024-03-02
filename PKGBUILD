# Maintainer: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

_name=aiotg
pkgname=python-aiotg
pkgver=2.0.0
pkgrel=1
pkgdesc="Asynchronous Python API for building Telegram bots"
url="https://github.com/szastupov/aiotg"
depends=('python-aiohttp' 'python-watchdog')
makedepends=(python-build python-installer python-wheel python-hatchling)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9932f117d3faaf10ee6b36c580ffa033d4a3311b0d54dcbd261cb93e8bae3b1e')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
