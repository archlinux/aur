# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-systembridgeshared'
_module='systembridgeshared'
_foldername='system-bridge-shared'
pkgver='4.0.4'
pkgrel=1
pkgdesc="System Bridge Shared"
url="https://github.com/timmo001/system-bridge-shared"
depends=('python')
makedepends=(
        'python-build'
        'python-installer'
        'python-wheel'
)
license=('Apache-2.0')
arch=('any')
source=("${_foldername}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('48a58e99787fb72b98ba7faf0bc599e8566283eda8ba68e55decae3a464c22ba1de7956c848f0ec1c58417f95181cb7aaac878a64e4e04369f8790458259a558')

build() {
	cd "${srcdir}/${_foldername}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_foldername}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
