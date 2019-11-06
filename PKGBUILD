pkgbase='python-flask-paginate'
pkgname=('python-flask-paginate')
_module='flask-paginate'
pkgver='0.5.5'
pkgrel=1
pkgdesc="Simple paginate support for flask"
url="https://github.com/lixxu/flask-paginate"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/a2/5a/133899485b67440d0bddbead5f90191f9bbb3c60b600dbddd184f85c2c1a/flask_paginate-${pkgver}-py2.py3-none-any.whl")
sha256sums=('d2aa07b4ef27f56f973482aaa06a0d93dc769a3e4d3e9c382a305ab72ac38ad9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
