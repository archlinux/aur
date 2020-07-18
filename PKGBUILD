pkgbase='python-dummy-pack'
pkgname=('python-dummy-pack')
_module='dummy-pack'
pkgver='0.0.1'
pkgrel=1
pkgdesc="dummy"
url="https://github.com/codeswhite/"
depends=('python' 'dee' 'python-interutils')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('24275b6be52a41350335e9194c2357a2c2ec8dbe89e88d025432ef73f962a277')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
