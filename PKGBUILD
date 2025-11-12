pkgbase='python-pyowm'
pkgname=('python-pyowm')
_module='pyowm'
pkgver='3.5.0'
pkgrel=1
pkgdesc="A Python wrapper around OpenWeatherMap web APIs"
url="http://github.com/csparpa/pyowm"
depends=('python>=3.9'
         'python-requests>=2.20.0' 'python-requests<3'
         'python-geojson>=2.3.0' 'python-geojson<4'
         'python-pysocks>=1.7.1' 'python-pysocks<2')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://github.com/csparpa/pyowm/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a1ddefe7c3d79ab81f0c3cd84fb53a40dc7e5bdcd20c1cea491e5ad5d45c8eec')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
