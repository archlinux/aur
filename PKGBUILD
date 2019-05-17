pkgbase='python-normality'
pkgname=('python-normality')
_module='normality'
pkgver='1.0.0'
pkgrel=1
pkgdesc="Micro-library to normalize text strings"
url="http://github.com/pudo/normality"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('94c1f8f72c14ffc82296351fafba70bcfdc6b4c79bc385318de1b1fbe9985b22')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
