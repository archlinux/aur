pkgbase='python-primesieve'
pkgname=('python-primesieve')
_module='primesieve'
pkgver='1.4.4'
pkgrel=1
pkgdesc="Fast prime number generator. Python bindings for primesieve C/C++ library"
url="https://github.com/hickford/primesieve-python"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('58bbff5c6928254e4fadd21ce324d8bae97aa706f72d69b1b0e1bf7ed6a1925c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
