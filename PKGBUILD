# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-texture2ddecoder
_module='texture2ddecoder'
pkgver=1.0.2
pkgrel=1
pkgdesc="a python wrapper for Perfare's Texture2DDecoder"
url="https://github.com/K0lb3/texture2ddecoder"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('71e165b5f1d51ba2e04c33c52ef441b763700752e40167a39e725010f1ee447c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
