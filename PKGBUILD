# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='python-sqlbag'
pkgname=('python-sqlbag')
_module='sqlbag'
pkgver='0.1.1617247075'
pkgrel=1
pkgdesc="various snippets of SQL-related boilerplate"
url="https://github.com/djrobstep/sqlbag"
depends=('python' 'python-sqlalchemy' 'python-greenlet')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b9d7862c3b2030356d796ca872907962fd54704066978d7ae89383f5123366ed')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
