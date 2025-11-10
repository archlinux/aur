# Maintainer: Jesse R Codling <codling at umich dot edu>

pkgname='python-optuna-integration'
_module='optuna-integration'
pkgver=4.6.0
pkgrel=1
pkgdesc="Optuna integration modules with third-party libraries."
url="https://optuna-integration.readthedocs.io/"
depends=('python' 'python-optuna')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://github.com/optuna/${_module}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('36305e6765831596e30254362518c77a6a0b7b37ae4c55cca31e499210d4d02a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
