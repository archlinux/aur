pkgbase='python-flask-paginate'
pkgname=('python-flask-paginate')
_module='flask-paginate'
pkgver='0.5.4'
pkgrel=1
pkgdesc="Simple paginate support for flask"
url="https://github.com/lixxu/flask-paginate"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('60079a1c4c600cb4d4a9f7c386ea357b5ee02355ae6d6e8b41f769ae3f7af3ad')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
