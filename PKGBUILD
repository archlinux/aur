pkgbase='python-pyglmnet'
pkgname=('python-pyglmnet')
_module='pyglmnet'
pkgver='1.1'
pkgrel=1
pkgdesc="Elastic-net regularized generalized linear models."
url="http://glm-tools.github.io/pyglmnet/"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('6949eb9ea14ca43b6fbfbdb25b89fc3493f8b8f78705523b3a603dcd85d707a6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
