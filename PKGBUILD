# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname='python-defopt'
_module='defopt'
pkgver=6.4.0
pkgrel=1
pkgdesc="Effortless argument parser"
url="https://github.com/anntzer/defopt"
depends=('python' 'python-sphinxcontrib-napoleon')
makedepends=('python-setuptools' 'python-build' 'python-installer')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('359a56137b4b7dcbc051d2157e6591a09c35c4297cfc00f1ef8dbcd192d19a34')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel . --outdir "${srcdir}" --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer "${srcdir}/${_module}-${pkgver}-py3-none-any.whl" --destdir="${pkgdir}"
}
