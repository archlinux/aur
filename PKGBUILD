pkgbase='python-vishop'
pkgname=('python-vishop')
_module='vishop'
pkgver='0.0.2'
pkgrel=1
pkgdesc="Vishop is command line VIM script publisher client."
url="https://github.com/Xvezda/vishop"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2c3d1cb655d47871af652473d6ebc17cac196f6ecd1f5013585920cd63f67d9a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
