pkgbase='python-pyowm'
pkgname=('python-pyowm')
_module='pyowm'
pkgver='3.3.0'
pkgrel=2
pkgdesc="A Python wrapper around OpenWeatherMap web APIs"
url="http://github.com/csparpa/pyowm"
depends=('python>=3.7'
         'python-requests>=2.20.0' 'python-requests<3'
         'python-geojson>=2.3.0' 'python-geojson<4'
         'python-pysocks>=1.7.1' 'python-pysocks<2')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://github.com/csparpa/pyowm/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7dafc9d062d84a56f7b5eb15810aee6506d0c39d42c7aebbd81876aa42387c71')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
