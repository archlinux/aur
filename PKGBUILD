#Maintainer: Popolon <popolon @t popolon d.t org>

pkgbase='python-osmpythontools'
pkgname=('python-osmpythontools')
_module='OSMPythonTools'
pkgver='0.3.6'
pkgrel=2
pkgdesc="A library to access OpenStreetMap related services"
url="https://github.com/mocnik-science/osm-python-tools"
depends=('python' 'python-geojson' 'python-ujson')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('13ff721f760fdad5dd78b4d1461d286b78bba96ee151a7301ee8c11a0c258be9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
