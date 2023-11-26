pkgbase='python-recoverpy'
pkgname=('python-recoverpy')
_module='recoverpy'
pkgver='2.1.4'
pkgrel=1
pkgdesc="A TUI to recover overwritten or deleted data."
url="https://github.com/PabloLec/recoverpy"
depends=('python')
makedepends=('python-build' 'python-installer')
license=(GNU GPLv3)
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('42ebbb7d9decd08dcd7a22026bd0a5c5579a91ff966139c19568a2f7b15320c3')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
