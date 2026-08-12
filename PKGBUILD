# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-go
pkgname=python-tree-sitter-go
pkgver=0.25.0
pkgrel=10
pkgdesc="Go grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-go"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter/tree-sitter-go/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2dc241b97872c53195e01b86542b411a3c1a6201d9c946c78d5c60c063bba1ef')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
