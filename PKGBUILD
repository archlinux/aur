# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-scala
pkgname=python-tree-sitter-scala
pkgver=0.26.3
pkgrel=1
_commit=b924e51f736723e336a30a00029485435cfd5ae8
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
sha256sums=('a6995273032072dfe6899a04dbf152164ef23104bbc7386ffbd3c5affff4f92a')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
