pkgbase='python-probat'
pkgname=('python-probat')
_module='probat'
pkgver='1.0.1'
pkgrel=1
pkgdesc="Battery life saver and reminder"
url="https://github.com/codeswhite/probat"
depends=('python' 'python-termcolor')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('639cd81ba684b406e0e6847c9a39379b8ad4a6cf7ce285e216fd22f8c622b5dc')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
