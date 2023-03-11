pkgbase='python-recoverpy'
pkgname=('python-recoverpy')
_module='recoverpy'
pkgver='2.0.3'
pkgrel=1
pkgdesc="A TUI to recover overwritten or deleted data."
url="https://github.com/PabloLec/recoverpy"
depends=('python')
makedepends=('python-setuptools')
license=(GNU GPLv3)
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('9f250bc12f7af5b2f0cd07fb5bb497ee463661858959f91d90e7b6b6949b2b1a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
