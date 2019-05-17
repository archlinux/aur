pkgbase='python-dataset'
pkgname=('python-dataset')
_module='dataset'
pkgver='1.1.2'
pkgrel=1
pkgdesc="Toolkit for Python-based database access."
url="http://github.com/pudo/dataset"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('06e6e8166a2ce12524ffbed97b82866caeaa2dd8e85ee65baccf3b815528e22e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
