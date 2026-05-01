# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfy-aimdo
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc="AI Model Demand Offloading Allocator"
arch=('any')
url="https://github.com/Comfy-Org/comfy-aimdo/"
license=('GPL-3.0')
depends=('python-pytorch')
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-scm)
source=(${_name}-${pkgver}.tar.gz::"https://github.com/Comfy-Org/comfy-aimdo/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_COMFY_AIMDO=${pkgver}
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
