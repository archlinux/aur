pkgbase=('python-aiozmq')
pkgname=('python-aiozmq')
_module='aiozmq'
pkgver='0.7.1'
pkgrel=1
pkgdesc="ZeroMQ integration with asyncio."
url="http://aiozmq.readthedocs.org"
depends=('python' 'python-pyzmq' 'python-msgpack')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/aiozmq/aiozmq-${pkgver}.tar.gz")
md5sums=('8b09d01d5544bbbc12d8a9319a8d7587')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
