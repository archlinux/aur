pkgbase='python-recoverpy'
pkgname=('python-recoverpy')
_module='recoverpy'
pkgver='2.0.1'
pkgrel=1
pkgdesc="A TUI to recover overwritten or deleted data."
url="https://github.com/PabloLec/recoverpy"
depends=('python')
makedepends=('python-setuptools')
license=(GNU GPLv3)
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('94dcdf8bfaf8af2293cef4323cd90994ca58ea4f2988fe8ff4c8103e953e66f0')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
