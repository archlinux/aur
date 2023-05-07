# Maintainer: Maciej Dems <macdems@gmail.com>
pkgbase='python-pockets'
pkgname=('python-pockets')
_module='pockets'
pkgver='0.9.1'
pkgrel=2
pkgdesc="A collection of helpful Python tools!"
url="http://pockets.readthedocs.org"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('9320f1a3c6f7a9133fe3b571f283bcf3353cd70249025ae8d618e40e9f7e92b3')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
