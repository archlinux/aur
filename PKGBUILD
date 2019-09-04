pkgbase='python-authlib'
pkgname=('python-authlib')
_module='Authlib'
pkgver='0.12'
pkgrel=1
pkgdesc="The ultimate Python library in building OAuth and OpenID Connect servers."
url="https://authlib.org/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d89cf1c1630ab2a589d9cf9254fd008a16670a49ba3f49046e5ec68a6ac833f6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
