pkgbase='python-flask-paginate'
pkgname=('python-flask-paginate')
_module='flask-paginate'
pkgver='0.5.3'
pkgrel=1
pkgdesc="Simple paginate support for flask"
url="https://github.com/lixxu/flask-paginate"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2237c072680b7b0f1f8f3fd64ae43d50304281addbbf2d7041f74413ebe4f496')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
