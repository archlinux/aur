# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=('python-codebug_tether')
_module='codebug_tether'
pkgver='0.9.1'
pkgrel=1
pkgdesc="Control CodeBug over Serial USB."
url="https://github.com/codebugtools/codebug_tether"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/codebug_tether/codebug_tether-${pkgver}.tar.gz")
md5sums=('507c8f489200df0695197765992b8800')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
