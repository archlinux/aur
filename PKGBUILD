# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-zig
pkgname=python-tree-sitter-zig
pkgver=1.1.2
pkgrel=7
pkgdesc="Zig grammar for tree-sitter"
arch=('any')
url="https://github.com/tree-sitter-grammars/tree-sitter-zig"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-zig/archive/refs/tags/v1.1.2.tar.gz")
sha256sums=('612d67059faa90ec7691e5d786d70d8f7c2c8b15b83de901b9b801122ad4cf25')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
