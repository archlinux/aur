# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-verilog
pkgname=python-tree-sitter-verilog
pkgver=1.0.3
pkgrel=10
_commit=521b535e41a5acd2c6539a922d4649bbe8275110
pkgdesc="Verilog grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/tree-sitter/tree-sitter-verilog"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/tree-sitter/tree-sitter-verilog/archive/${_commit}.tar.gz")
sha256sums=('4d381faf44cc11046575ca9d82f7de5af6acb90b43f774cd9f8979afe05afb9c')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
