# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-verilog
pkgname=python-tree-sitter-verilog
pkgver=1.0.3
pkgrel=8
pkgdesc="Verilog grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-verilog"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter/tree-sitter-verilog/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2b985c74fa7d0035db7415908935cf1ba7eea3d928ccebfa1d89541d5b6fa7b4')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
