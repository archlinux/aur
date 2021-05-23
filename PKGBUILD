# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='python-schemainspect'
pkgname=('python-schemainspect')
_module='schemainspect'
pkgver='3.0.1616029793'
pkgrel=1
pkgdesc="Schema inspection for PostgreSQL (and possibly others)"
url="https://github.com/djrobstep/schemainspect"
depends=('python' 'python-sqlalchemy' 'python-greenlet')
makedepends=('python-setuptools')
license=('Unlicense')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b81f0482e0df338032eda30ee6e41f69df7d15a21b03688fd1128cdbcb409e6c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-schemainspect/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
