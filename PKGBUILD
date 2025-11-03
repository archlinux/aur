pkgbase='python-proglog'
pkgname=('python-proglog')
_module='proglog'
pkgver='0.1.12'
pkgrel=1
pkgdesc="Log and progress bar manager for console, notebooks, web..."
url=""
depends=('python' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('361ee074721c277b89b75c061336cb8c5f287c92b043efa562ccf7866cda931c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
