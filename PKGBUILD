pkgbase='python-orcid'
pkgname=('python-orcid')
_module='orcid'
pkgver='1.0.3'
pkgrel=1
pkgdesc="A python wrapper over the ORCID API"
url="https://github.com/ORCID/python-orcid"
depends=('python' 'python-simplejson')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('5fe28b6d92aed5abe7145c959e4fa2afb90260be215ff3f36ad31c94ee41d0db')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
