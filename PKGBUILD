# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-julia
pkgname=python-tree-sitter-julia
pkgver=0.23.1
pkgrel=7
pkgdesc="Julia grammar for tree-sitter"
arch=('any')
url="https://github.com/tree-sitter/tree-sitter-julia"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter/tree-sitter-julia/archive/refs/tags/v0.23.1.tar.gz")
sha256sums=('9f6926734e09110dd4792f6c327c6b547834b52b8ce2bc7c1eba2ed4f7f7aba0')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
