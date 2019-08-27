pkgbase='python-normality'
pkgname=('python-normality')
_module='normality'
pkgver='2.0.0'
pkgrel=1
pkgdesc="Micro-library to normalize text strings"
url="http://github.com/pudo/normality"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('7998d4b7fcc339e342611377a6b5aaf74107b01e353c505978479a88bd9b9f3c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
