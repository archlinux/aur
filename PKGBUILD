pkgbase='python-googlemaps'
pkgname=('python-googlemaps')
_module='googlemaps'
pkgver='3.0.2'
pkgrel=1
pkgdesc="Python client library for Google Maps API Web Services"
url="https://github.com/googlemaps/google-maps-services-python"
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('e13d8f4101f033bc39d76ade52f99977f077814d79087794735d1bb71f35dcc2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
