pkgbase='python-mpl-interactions'
pkgname=('python-mpl-interactions')
_module='mpl_interactions'
pkgver='0.24.1'
pkgrel=1
pkgdesc="Matplotlib aware interact functions"
url="https://github.com/mpl-extensions/mpl-interactions"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('a77b4092b60099951bc9460ed3a4fd9fe17f507e751cf178d5e123eed6363b3f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
