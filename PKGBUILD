# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=python-vulkan
pkgver=1.1.99.1
pkgrel=3
pkgdesc="The ultimate Python binding for Vulkan API"
arch=('any')
url="https://github.com/realitix/vulkan"
license=('Apache')
depends=('python' 'python-cffi' 'vulkan-icd-loader')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/realitix/vulkan/archive/${pkgver}.tar.gz")
sha384sums=('43675c9ae7092a31b02478768da8bb89ec53bca74dafa692f9fac687e096e40dc8cef879f104e84d0b8a1e18b5853ff7')

build() {
    cd "vulkan-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "vulkan-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
