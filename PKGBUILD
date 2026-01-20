pkgname=python-deutsche-bahn-api
pkgver=1.1.0
pkgrel=6
pkgdesc="Python client for the Deutsche Bahn Timetables API"
arch=('any')
url="https://pypi.org/project/deutsche-bahn-api/"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
source=(
    "https://files.pythonhosted.org/packages/source/d/deutsche-bahn-api/deutsche_bahn_api-${pkgver}.tar.gz"
    "https://files.pythonhosted.org/packages/source/m/mpu/mpu-0.23.1.tar.gz"
)
sha256sums=('34372193d2b105dcc97ba13384031ea2aacd27728a9c006170a6d5a6d136aa99' '93d6409d3556178e6fd24b90b151d60f2ddeea5b17844e0c615d802f5510395b')

makedepends=('python-build' 'python-installer' 'python-wheel')

build() {
    cd "deutsche_bahn_api-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "deutsche_bahn_api-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
check() {
    cd "deutsche_bahn_api-${pkgver}"
    python -c "import deutsche_bahn_api, mpu; print('All imports successful')"
}

