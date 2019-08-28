pkgbase='python-googlemaps'
pkgname=('python-googlemaps')
_module='googlemaps'
pkgver='3.1.0'
pkgrel=1
pkgdesc="Python client library for Google Maps Platform"
url="https://github.com/googlemaps/google-maps-services-python"
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f563d780aae286bbdad347584ee505b1deee0419bec88b9b7ea53ec1024646b7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
