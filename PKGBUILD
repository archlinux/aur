# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-zopflipy'
pkgname=('python-zopflipy')
_module='zopflipy'
pkgver='1.5'
pkgrel=1
pkgdesc="A Python bindings for Zopfli"
url="https://github.com/hattya/zopflipy"
depends=('python')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/fc/63/5c088c11bc21950ca888f8c1ef0170e4a4670b68e8d107d49d32e8de7549/zopflipy-${pkgver}.zip")
sha256sums=('7f12ced241a403f588994a77fc7ae1c5e76fb2a965ac1d3bdf444e2a2c7e113d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
