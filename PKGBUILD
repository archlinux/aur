# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='python-migra'
pkgname=('python-migra')
_module='migra'
pkgver='3.0.1621480950'
pkgrel=1
pkgdesc="Like `diff` but for PostgreSQL schemas"
url="https://databaseci.com/docs/migra"
depends=('python' 'python-schemainspect' 'python-sqlbag')
makedepends=('python-setuptools')
license=('Unlicense')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('5fdce56fe7de79b17b7875250c1e90c645117cc8d358c5a43b38b815390a4445')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-migra/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
