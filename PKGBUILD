# Maintainer: zephyrdrh <zephyrdrh at gmx dot de>
# Contributor: ShadowKyogre <shadowkyogre dot public at gmail dot com>

_hash_id="15/7d/0a6ec4478d2949e24a127525df477251d256a31661751c2605d1e2e25c2a"
pkgname=slickpicker
pkgver=0.2
pkgrel=2
pkgdesc="A small PyQt color picker widget (can be run on its own)"
arch=('any')
url="https://github.com/ShadowKyogre/slickpicker/"
license=('GPL-3.0-only')
depends=('python' 'python-pyqt5')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("https://pypi.python.org/packages/${_hash_id}/${pkgname}-${pkgver}.tar.gz")
md5sums=('dacc7a4f16e1f7981d19d53bdea36dc7')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
