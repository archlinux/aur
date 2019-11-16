pkgbase='python-googlemaps'
pkgname=('python-googlemaps')
_module='googlemaps'
pkgver='3.1.4'
pkgrel=1
pkgdesc="Python client library for Google Maps Platform"
url="https://github.com/googlemaps/google-maps-services-python"
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('fc51565fa5e008391dc1df526997a029424dc7be60517ab12fc07708c2bf5930')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
