pkgbase='python-flask-paginate'
pkgname=('python-flask-paginate')
_module='flask-paginate'
pkgver='0.5.2'
pkgrel=1
pkgdesc="Simple paginate support for flask"
url="https://github.com/lixxu/flask-paginate"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('ebc896bf6e8d7a414e3efba0bd0770a8f73dcd7023f99e849c64164287e36e9b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
