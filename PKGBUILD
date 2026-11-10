# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-scala
pkgname=python-tree-sitter-scala
pkgver=0.26.11
pkgrel=1
_commit=b22db807e45caca5cc2fa55a9067b49f119c3183
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
sha256sums=('5424cff37c1a0f6d0c9746b3f611383229acee3a5ae17b667edb3aa7b8567135')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
