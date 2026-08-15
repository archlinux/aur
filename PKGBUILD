pkgname=python-aiowebostv
pkgver=0.9.1
pkgrel=1
pkgdesc="Library to control webOS based LG TV devices"
arch=('any')
url="https://github.com/home-assistant-libs/aiowebostv"
license=('Apache-2.0')
depends=(
    'python'
    'python-aiohttp'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("https://pypi.org/packages/source/a/aiowebostv/aiowebostv-${pkgver}.tar.gz")
sha256sums=('3968478fd56f32cea151ca2a3729b70be9269314f398a2ec00e0a09081ad8675')

build() {
    cd "aiowebostv-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "aiowebostv-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
