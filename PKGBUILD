# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname='python-defopt'
_module='defopt'
pkgver=6.2.0
pkgrel=1
pkgdesc="Effortless argument parser"
url="https://github.com/anntzer/defopt"
depends=('python' 'python-sphinxcontrib-napoleon')
makedepends=('python-setuptools' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('cfe6ecfb54b1368a5cc45d9d58fb3c125e4b4b789e08fd29b5722404b57e137d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
