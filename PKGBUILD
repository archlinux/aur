# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname="python-cachelib"
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc="A collection of cache libraries in the same API interface. Extracted from werkzeug"
arch=('any')
url="https://github.com/pallets/cachelib"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('cc1856259f102c9273efa342100f70d9fafbd07b41ce05c501ee28e1dbbb5133')

build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
