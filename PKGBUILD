# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-kotlin
pkgname=python-tree-sitter-kotlin
pkgver=1.1.0
pkgrel=10
_commit=77dd60ea0a9003ce062c9728a513ffe1aaff8c82
arch=('x86_64' 'aarch64')
pkgdesc="Kotlin grammar for tree-sitter"
url="https://github.com/tree-sitter-grammars/tree-sitter-kotlin"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-kotlin/archive/${_commit}.tar.gz")
sha256sums=('6141d81811c33195e6f7c37142db396043b385cf668ecf73acffa19a18203448')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
