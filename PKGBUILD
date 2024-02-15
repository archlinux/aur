#Maintainer: Popolon <popolon @t popolon d.t org>

pkgname='python-osmpythontools'
_module='OSMPythonTools'
pkgver='0.3.5'
pkgrel=3
pkgdesc="A library to access OpenStreetMap related services"
url="https://github.com/mocnik-science/osm-python-tools"
depends=('python' 'python-geojson' 'python-ujson')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('i386' 'i686' 'x86_64' 'riscv32' 'riscv64' 'armv7h' 'aarch64')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('13ff721f760fdad5dd78b4d1461d286b78bba96ee151a7301ee8c11a0c258be9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
