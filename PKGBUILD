pkgbase='python-normality'
pkgname=('python-normality')
_module='normality'
pkgver='1.0.1'
pkgrel=1
pkgdesc="Micro-library to normalize text strings"
url="http://github.com/pudo/normality"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('a7ddffa23f4fbc0de1c1f621550555967c65581140c80528e953e08333389553')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
