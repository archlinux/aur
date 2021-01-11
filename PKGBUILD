pkgbase='python-pyowm'
pkgname=('python-pyowm')
_module='pyowm'
pkgver='3.1.1'
pkgrel=1
pkgdesc="A Python wrapper around OpenWeatherMap web APIs"
url="http://github.com/csparpa/pyowm"
depends=('python>=3.7'
         'python-requests>=2.20.0' 'python-requests<3'
         'python-geojson>=2.3.0' 'python-geojson<3'
         'python-pysocks>=1.7.1' 'python-pysocks<2')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/csparpa/pyowm/archive/$pkgver.tar.gz")
sha256sums=('9785e5cab4aaf2bddde4268b83841033acca363b06d97f941832adb52c00ead4')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
