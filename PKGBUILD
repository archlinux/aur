# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=python-vulkan
pkgver=1.3.275.1
pkgrel=1
pkgdesc="The ultimate Python binding for Vulkan API"
arch=('any')
url="https://github.com/realitix/vulkan"
license=('Apache-2.0')
depends=('python' 'python-cffi' 'vulkan-icd-loader')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/realitix/vulkan/archive/${pkgver}.tar.gz")
sha384sums=('a8062813cfa221166c4b735b6300968fec90e16af59b44402331b10a26383c35208c2fc1cf798ee09fb7470164bda67e')

build() {
  cd "vulkan-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "vulkan-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
