pkgbase='python-hankel'
pkgname=('python-hankel')
_module='hankel'
pkgver='1.1.0'
pkgrel=1
pkgdesc="Hankel Transformations using method of Ogata 2005"
url="https://github.com/steven-murray/hankel"
depends=('python' 'python-numpy>=1.9.3', 'python-scipy>=0.16.1', 'python-mpmath>=1.0.0')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('83764755e132a86c6c801f02722d544c69a469b2dda1a338eafb663c4c9053e4')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
