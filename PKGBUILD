# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-scala
pkgname=python-tree-sitter-scala
pkgver=0.26.13
pkgrel=1
_commit=e8728b1c62ea096c753a9a70325f77ebbf2192de
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
sha256sums=('dd2a12ebf07b488fb808e6790cefb0c6ddd1b91840a31efcfd6e6e53595f6bd7')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
