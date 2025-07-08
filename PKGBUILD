# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-texture2ddecoder
_module='texture2ddecoder'
pkgver=1.0.5
pkgrel=1
pkgdesc="a python wrapper for Perfare's Texture2DDecoder"
url="https://github.com/K0lb3/texture2ddecoder"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('7767e865394ad8e0a0609d275caf3e8c99d03df107dfb961cb90ea21c9295dc2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
