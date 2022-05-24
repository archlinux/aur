# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname="python-cachelib"
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="A collection of cache libraries in the same API interface. Extracted from werkzeug"
arch=('any')
url="https://github.com/pallets/cachelib"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('df254f3b900dc8684d8ebdd146c731ddb45edc6233a6cf7e3e834c949f360726')

build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
