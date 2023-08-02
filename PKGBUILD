pkgbase='python-ikernel-remote'
pkgname=('python-ikernel-remote')
_module='ikernel_remote'
pkgver='1.0.2'
pkgrel=3
pkgdesc="Running IPython kernels remotely and through batch queues"
url="https://github.com/macdems/ikernel_remote"
depends=('python' 'python-pexpect' 'jupyter-notebook' 'jupyter-lsp')
conflicts=('jupyter-nbclassic')
makedepends=('python-build' 'python-installer')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d454ed2177b430d5674028b8f6cdd3e1bb4b8ff55fc7b0bd6723d049182b1192')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/${_module}-${pkgver}-py3-none-any.whl
}
