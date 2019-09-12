pkgbase='python-googlemaps'
pkgname=('python-googlemaps')
_module='googlemaps'
pkgver='3.1.2'
pkgrel=1
pkgdesc="Python client library for Google Maps Platform"
url="https://github.com/googlemaps/google-maps-services-python"
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f25791d855121ae6b2a03c19d7709e1f060b48ef987c6543dc1e2ad7b695792c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
