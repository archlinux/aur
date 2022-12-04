# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgbase='python-sqlalchemy2-stubs'
pkgname=('python-sqlalchemy2-stubs')
_module='sqlalchemy2-stubs'
pkgver='0.0.2a29'
pkgrel=1
pkgdesc="Typing Stubs for SQLAlchemy 1.4"
url="http://www.sqlalchemy.org"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('208850a5bd16aa623ab6b9a5883b855dbe88b504150833cfb873904048db74d98749f48a34ab108b08f5294fb13e16c1061a07deb3cc8f04bdbb4fcc05150d89')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
