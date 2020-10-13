# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-osm_conflate
_module=osm_conflate
pkgver=1.4.1
pkgrel=1
pkgdesc="Script for merging points from a third-party source with OpenStreetMap data"
url="https://github.com/mapsme/osm_conflate"
depends=('python' 'python-kdtree')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('8dcf1312b98cedeb50136d91c3c802019a2417f66b1dacb73fc4f97e13bf92ea')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
