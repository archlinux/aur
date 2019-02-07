pkgbase=('python-redisgraph')
pkgname=('python-redisgraph')
_module='redisgraph'
pkgver='1.7'
pkgrel=1
pkgdesc="RedisGraph Python Client"
url="https://github.com/redislabs/redisgraph-py"
depends=('python' 'python-ptable' 'python-redis')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/redisgraph/redisgraph-${pkgver}.tar.gz")
md5sums=('6de7ea87415911d5cc6bce8279f09f39')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
