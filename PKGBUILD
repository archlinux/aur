pkgbase='python-pyowm'
pkgname=('python-pyowm')
_module='pyowm'
pkgver='3.2.0'
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
source=("https://github.com/csparpa/pyowm/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6c368fd0b1a9f21e714cff7be31aa318736fb7f6e426273f65f1b81b524870bc')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
