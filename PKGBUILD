pkgbase='python-pyowm'
pkgname=('python-pyowm')
_module='pyowm'
pkgver='3.0.0'
pkgrel=1
pkgdesc="A Python wrapper around OpenWeatherMap web APIs"
url="http://github.com/csparpa/pyowm"
depends=('python>=3.7'
         'python-requests>=2.20.0' 'python-requests<3'
         'python-geojson>=2.3.0' 'python-geojson<3')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/csparpa/pyowm/archive/$pkgver.tar.gz")
sha256sums=('9073d2ebb13b4c8878059b7c26aa1af2ad5675f74e060ac3828e148026458c99')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
