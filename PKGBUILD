pkgbase=('python-cloudant')
pkgname=('python-cloudant')
_module='cloudant'
pkgver='2.10.0'
pkgrel=1
pkgdesc="Cloudant / CouchDB Client Library"
url="https://github.com/cloudant/python-cloudant"
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/cloudant/cloudant-${pkgver}.tar.gz")
md5sums=('8c791477c49c44c29f142e89c915b99f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
