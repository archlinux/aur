# Maintainer: Erwin-Iosef <erwiniosef@gmail.com>

pkgname=python-openttd-helpers
_name="${pkgname#python-}"
pkgver=2.0.0
pkgrel=1
pkgdesc="Python libraries to support OpenTTD projects"
url="https://github.com/OpenTTD/py-helpers"
source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('4ec741d3722d3fa68753f41f2481ca9ac58ece4d65c1da5f0753458bece30de7')
license=('LGPL-2.1-only')
arch=(any)
depends=('python>=3.11' 'python-click' 'python-sentry_sdk')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
