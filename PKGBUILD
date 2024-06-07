# Maintainer: Khorne <khorne@khorne.me>
pkgname=python-pinecil
_name=${pkgname##python-}_lib
pkgver=0.2.14
pkgrel=1
pkgdesc="A python interface for Pinecil V2 controls and settings."
arch=('any')
url="https://github.com/builder555/pinecil_lib"
license=('MIT')
depends=('python' 'python-bleak')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${_name}-${pkgver}.tar.gz::https://github.com/builder555/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ce7dfa49ecd2dabab667ac717729e070b7a482b6dba3cb7b70e69b5efd40ca02')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
