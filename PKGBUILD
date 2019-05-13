pkgbase='python-cloudant'
pkgname=('python-cloudant')
_module='cloudant'
pkgver='2.12.0'
pkgrel=1
pkgdesc="Cloudant / CouchDB Client Library"
url="https://github.com/cloudant/python-cloudant"
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('641b7fa47d0055fafcb712ba4435ae4bd8b60e88e52ac3328411817524f50c24')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
