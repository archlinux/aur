# Maintainer: Jesse R Codling <codling at umich dot edu>

pkgname='python-optuna-integration'
_module='optuna-integration'
pkgver='4.4.0'
pkgrel=1
pkgdesc="Optuna integration modules with third-party libraries."
url="https://optuna-integration.readthedocs.io/"
depends=('python' 'python-optuna')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://github.com/optuna/${_module}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a8f534dd13cb705de20fb5dcc1701854179fcb81aacb822369dd70012d356cfa')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
