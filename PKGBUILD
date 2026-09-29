# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-zig
pkgname=python-tree-sitter-zig
pkgver=1.1.2
pkgrel=10
_commit=b670c8df85a1568f498aa5c8cae42f51a90473c0
pkgdesc="Zig grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/tree-sitter-grammars/tree-sitter-zig"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-zig/archive/${_commit}.tar.gz")
sha256sums=('c7af5b1a992fcaffdf50a11a9974fbf8f09d20c4d9ef42245ac90c152dd3a85a')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
