# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-lua
pkgname=python-tree-sitter-lua
pkgver=0.5.0
pkgrel=10
pkgdesc="Lua grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-lua"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-lua/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf01b93f4b61b96a6d27942cf28eeda4cbce7d503c3bef773a8930b3d778a2d9')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
