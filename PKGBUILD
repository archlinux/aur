# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-powershell
pkgname=python-tree-sitter-powershell
pkgver=0.26.3
pkgrel=9
pkgdesc="Powershell grammar for tree-sitter"
arch=('any')
url="https://github.com/airbus-cert/tree-sitter-powershell"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/airbus-cert/tree-sitter-powershell/archive/refs/tags/v0.26.3.tar.gz")
sha256sums=('38f9cba3174dc63274336120070cd6a1828fa8eb832360b94ed2ddfe6c3ac226')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
