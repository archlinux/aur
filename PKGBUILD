pkgbase=('python-pysqlcipher3')
pkgname=('python-pysqlcipher3')
_module='pysqlcipher3'
pkgver='1.0.2'
pkgrel=1
pkgdesc="DB-API 2.0 interface for SQLCIPHER 3.x"
url="https://github.com/rigglemania/pysqlcipher3"
depends=('python')
makedepends=('python-setuptools')
license=('ZLIB')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pysqlcipher3/pysqlcipher3-${pkgver}.tar.gz")
md5sums=('387aa1f10ff84b72d879c111c6fce3d7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
