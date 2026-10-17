# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-scala
pkgname=python-tree-sitter-scala
pkgver=0.26.3
pkgrel=2
_commit=851032fc97297bbe299dabe5bd826f778794d03c
pkgdesc="Scala grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/tree-sitter/tree-sitter-scala"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/tree-sitter/tree-sitter-scala/archive/${_commit}.tar.gz")
sha256sums=('754ca8623cfbc8ef76e8202398e0b93847fd877a6792c3d0c5e6bde27226d0d0')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
