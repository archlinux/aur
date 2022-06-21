# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname="python-cachelib"
_name=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc="A collection of cache libraries in the same API interface. Extracted from werkzeug"
arch=('any')
url="https://github.com/pallets/cachelib"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e358f6f82cf633891f0dbd3996e300b4657716ac44b301df33b9cb2cfd6eea6d')

build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
