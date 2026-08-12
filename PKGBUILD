# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-powershell
pkgname=python-tree-sitter-powershell
pkgver=0.26.5
pkgrel=2
pkgdesc="Powershell grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/airbus-cert/tree-sitter-powershell"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/airbus-cert/tree-sitter-powershell/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a949ac2bccd74b94b6199702c8b119cb353785e8a8828150a763b202ae8d4534')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
