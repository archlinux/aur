# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-texture2ddecoder
_module='texture2ddecoder'
pkgver=1.0.4
pkgrel=1
pkgdesc="a python wrapper for Perfare's Texture2DDecoder"
url="https://github.com/K0lb3/texture2ddecoder"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('a4e511f2ea56af1293b3f1d290ca30820b2a6233181929c50d79392b78ec04ea')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
