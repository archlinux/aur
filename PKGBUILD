pkgbase='python-mpl-interactions'
pkgname=('python-mpl-interactions')
_module='mpl_interactions'
pkgver='0.23.0'
pkgrel=1
pkgdesc="Matplotlib aware interact functions"
url="https://github.com/mpl-extensions/mpl-interactions"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('bf1c769b71e4c6c68b31f5f92f28cab068f667252f6f41aef552fe39b81c6964')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
