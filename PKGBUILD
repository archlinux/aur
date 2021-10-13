pkgbase='python-flask-simpleldap'
pkgname=('python-flask-simpleldap')
_module='Flask-SimpleLDAP'
pkgver='1.4.0'
pkgrel=1
pkgdesc="LDAP authentication extension for Flask"
url="https://github.com/admiralobvious/flask-simpleldap"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('812f7a476317e3e4a66549d773d470617e4153f2024fb956872b8f0998765275')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
