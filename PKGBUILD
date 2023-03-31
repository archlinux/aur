pkgbase='python-recoverpy'
pkgname=('python-recoverpy')
_module='recoverpy'
pkgver='2.0.4'
pkgrel=1
pkgdesc="A TUI to recover overwritten or deleted data."
url="https://github.com/PabloLec/recoverpy"
depends=('python')
makedepends=('python-build' 'python-installer')
license=(GNU GPLv3)
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('8369dbd25c211137909694bb3e758fa2b5009703d6019c1966f0c92f1972562b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
